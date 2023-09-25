; Methods

(package_declaration
  name: (_) @qualified_name)

; import package.name.Type;
(single_type_import
  (scoped_identifier
    scope: (_) @qualified_name
    name: (_) @type))

; import package.name.*;
(type_import_on_demand
  (scoped_identifier) @qualified_name
  (asterisk) @imported_member)

; import package.name.Type.MEMBER;
(single_static_import
  (scoped_identifier
    scope: (_) @qualified_name
    name: (_) @type)
  (identifier) @imported_member .)

; import static package.name.Type.*;
(static_import_on_demand
  (scoped_identifier
    scope: (_) @qualified_name
    name: (_) @type)
  (asterisk) @imported_member)

(method_declaration
  name: (identifier) @function.method)
(method_invocation
  name: (identifier) @function.method)
(super) @function.builtin

; Annotations

(annotation
  name: (identifier) @attribute)
(marker_annotation
  name: (identifier) @attribute)

"@" @operator

; Types

(type_identifier) @type

(interface_declaration
  name: (identifier) @type)
(class_declaration
  name: (identifier) @type)
(enum_declaration
  name: (identifier) @type)

((field_access
  object: (identifier) @type
  field: (_) @constant)
 (#match? @type "^[A-Z]"))
((scoped_identifier
  scope: (identifier) @type)
 (#match? @type "^[A-Z]"))
((method_invocation
  object: (identifier) @type)
 (#match? @type "^[A-Z]"))
((method_reference
  . (identifier) @type)
 (#match? @type "^[A-Z]"))

(constructor_declaration
  name: (identifier) @type)

[
  (boolean_type)
  (integral_type)
  (floating_point_type)
  (floating_point_type)
  (void_type)
] @type.builtin

; Variables

((identifier) @constant
 (#match? @constant "^_*[A-Z][A-Z\\d_]+$"))

(identifier) @variable

(this) @variable.builtin

; Literals

[
  (hex_integer_literal)
  (decimal_integer_literal)
  (octal_integer_literal)
  (decimal_floating_point_literal)
  (hex_floating_point_literal)
] @number

[
  (character_literal)
  (string_literal)
] @string
(escape_sequence) @string.escape

[
  (true)
  (false)
  (null_literal)
] @constant.builtin

[
  (line_comment)
  (block_comment)
] @comment

; Keywords

[
  "abstract"
  "assert"
  "break"
  "case"
  "catch"
  "class"
  "continue"
  "default"
  "do"
  "else"
  "enum"
  "exports"
  "extends"
  "final"
  "finally"
  "for"
  "if"
  "implements"
  "import"
  "instanceof"
  "interface"
  "module"
  "native"
  "new"
  "non-sealed"
  "open"
  "opens"
  "package"
  "private"
  "protected"
  "provides"
  "public"
  "requires"
  "record"
  "return"
  "sealed"
  "static"
  "strictfp"
  "switch"
  "synchronized"
  "throw"
  "throws"
  "to"
  "transient"
  "transitive"
  "try"
  "uses"
  "volatile"
  "while"
  "with"
] @keyword
