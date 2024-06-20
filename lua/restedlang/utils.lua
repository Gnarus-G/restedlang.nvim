--- Taken, and adapted, from https://github.com/David-Kunz/gen.nvim/blob/main/lua/gen/init.lua#L125
local function get_window_options()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local win_width = vim.api.nvim_win_get_width(0)
  local new_win_width = math.floor(win_width / 2)
  local win_height = vim.api.nvim_win_get_height(0)
  local new_win_height = math.floor(win_height / 2)

  -- Defining the top-left of the floating window in a way to center it.
  local new_win_row = math.floor(new_win_height / 2) - cursor[1]
  local new_win_col = math.floor(new_win_width / 2) - cursor[2] - 5

  return {
    relative = "cursor",
    width = new_win_width,
    height = new_win_height,
    row = new_win_row,
    col = new_win_col,
    --[[ style = "minimal", ]]
    border = "rounded"
  }
end


--- Taken from https://github.com/David-Kunz/gen.nvim/blob/main/lua/gen/init.lua#L125
--- @param lines string[]
local function write_to_buffer(lines, buf, win)
  if not buf or not vim.api.nvim_buf_is_valid(buf) then
    return
  end

  local all_lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  local last_row = #all_lines
  local last_row_content = all_lines[last_row]
  local last_col = string.len(last_row_content)

  local text = table.concat(lines or {}, "\n")

  vim.api.nvim_buf_set_option(buf, "modifiable", true)
  vim.api.nvim_buf_set_text(buf, last_row - 1, last_col,
    last_row - 1, last_col, vim.split(text, "\n"))

  -- Move the cursor to the end of the new lines
  local new_last_row = last_row + #lines - 1
  vim.api.nvim_win_set_cursor(win, { new_last_row, 0 })

  vim.api.nvim_buf_set_option(buf, "modifiable", false)
end

return {
  create_window = function()
    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, get_window_options())
    vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
    return buf, win
  end,
  write_to_buffer = write_to_buffer
}
