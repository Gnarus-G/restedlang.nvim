local ns_name = "restedlang"
local utils = require "restedlang.utils"

local M = {
  --- @type integer?
  client_id = nil
}

---@type lsp.Handler
local function run_command_handler(err, result, ctx)
  if err ~= nil then
    vim.notify(err.message);
    return
  end

  assert(ctx.client_id == M.client_id, "wrong client, expected id: " .. M.client_id .. "; got: " .. ctx.client_id)
  assert(type(result) == "table" and #result > 0, "result data should be a non empty array")

  --[[ vim.notify(vim.inspect(result)) ]]

  local buf, win = utils.create_window()
  utils.write_to_buffer(result, buf, win)
end

local codelens_augroup = vim.api.nvim_create_augroup(ns_name .. ":codeLenses", { clear = true })

---@param bufnr integer
---@return vim.lsp.Client?
local function get_rdtls_client(bufnr)
  local clients = vim.lsp.get_clients({ buffer = bufnr })

  for _, client in pairs(clients) do
    if client.name == "rstdls" then
      M.client_id = client.id
      return client
    end
  end

  return nil
end


M.setup = function()
  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'Sets up rstdls codelens autocommands',
    group = codelens_augroup,
    callback = function(event)
      if not get_rdtls_client(event.buf) then
        return
      end

      vim.lsp.handlers["workspace/executeCommand"] = vim.lsp.with(run_command_handler, {})

      vim.api.nvim_create_autocmd({ 'CursorHold', 'BufEnter', 'InsertLeave' }, {
        group = codelens_augroup,
        buffer = event.buf,
        callback = function()
          vim.lsp.codelens.refresh({ bufnr = event.buf })
        end
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = codelens_augroup,
        buffer = event.buf,
        callback = function(e)
          vim.lsp.codelens.clear(e.data.client_id, e.buf)
        end
      })
    end
  })
end

return M
