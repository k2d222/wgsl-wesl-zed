; comments

(line_comment) @comment.line
(block_comment) @comment.block

; variables, types, constants

(identifier) @variable

(param
  name: (_) @variable.parameter)

(struct_decl
  name: (_) @type)

(struct_member
  name: (_) @variable.other.member)

(named_component_expression
  component: (_) @variable.other.member)

((identifier) @type
  (#match? @type "^[A-Z]"))

((identifier) @constant
  (#match? @constant "^[A-Z0-9_]+$"))

(type_specifier
    (identifier) @type)

; imports (WESL extension)

(import_item (identifier) @namespace)

(import_path (identifier) @namespace)

(ident_path (identifier) @namespace)

(import_item (identifier) @type
  (#match? @type "^[A-Z]"))

(import_item (identifier) @constant
  (#match? @constant "^[A-Z0-9_]+$"))

; functions

(function_decl 
  (function_header
    (identifier) @function))

(call_expression
  (identifier) @function.call)

(func_call_statement
  (identifier) @function)

; templates

(template_list) @punctuation

(type_specifier
  (template_list
    (identifier) @type))

(template_list
  (template_list
    (identifier) @type))

(variable_decl ; this is var<storage> et.al
  (template_list
    (identifier) @keyword.storage.modifier))

; attributes

(attribute
  (identifier) @attribute) @attribute

(attribute
  (identifier) @attribute
  (argument_list
    (identifier) @variable.builtin)
  (#eq? @attribute "builtin"))

; literals

(bool_literal) @constant.builtin.boolean
(int_literal) @constant.numeric.integer
(hex_int_literal) @constant.numeric.integer
(float_literal) @constant.numeric.float

; keywords

[
  "alias"
  "virtual" ; Bevy / naga_oil extension
] @keyword

[
  "switch"
  "case"
  "default"
  "break"
  "continue"
  "continuing"
  "discard"
  "const_assert"
] @keyword.control

[ "fn" ] @keyword.control.function
[ "if" "else" ] @keyword.control.conditional
[ "loop" "for" "while" ] @keyword.control.repeat
[ "return" ] @keyword.control.return
[ "var" "let" "const" "override" "struct" ] @keyword.storage.type
[ "diagnostic" "enable" "requires" ] @keyword.directive
[ "import" "as" ] @keyword.control.import ; WESL import extension

; expressions

[
  "-" "!" "~" "*" "&" ; unary
  "^" "|" "/" "%" "+" "&&" "||" (shift_left) (shift_right) ; binary
  (less_than) (greater_than) (less_than_equal) (greater_than_equal) "==" "!=" ; relational
  "+=" "-=" "*=" "/=" "%=" "|=" "^=" "++" "--" "=" ; assign
  "->" ; return
] @operator

; punctuation

[ "(" ")" "[" "]" "{" "}" ] @punctuation.bracket
[ "," "." ":" "::" ";" ] @punctuation.delimiter

; preprocessor

[ (preproc_directive) "#import" ] @keyword.directive
