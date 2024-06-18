(request_method) @type
[
 "set"
 "let"
 "header"
 "body"
] @keyword

[
 "{"
 "}"
 "["
 "]"
 "("
 ")"
] @punctuation.bracket

[
 "="
] @operator

(attribute) @attribute

(constant_identifier) @constant

(call (identifier) @function)

[
 (string)
 (template_string)
] @string

[
 (url_literal)
 (pathname_literal)
] @string.special

(number) @number

[
 (boolean)
 "null"
] @constant.builtin


(template_substitution
  "${" @punctuation.special
  "}" @punctuation.special) @embedded

[
  ","
] @punctuation.delimiter

(line_comment) @comment
