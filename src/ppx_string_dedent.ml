open! Ppxlib

let () =
  Driver.register_transformation
    "ppx_string_dedent"
    ~extensions:
      [ Ppx_string.extension
          ~name:"ppx_string_dedent.string_dedent"
          ~config:
            { fully_qualified_runtime_module =
                Ldot (Lident "Ppx_string_runtime", "For_string")
            ; conversion_function_name = "to_string"
            ; preprocess_before_parsing = Some Dedent.string
            ; assert_list_is_stack_allocated = false
            }
      ]
;;
