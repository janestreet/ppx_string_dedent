# ppx_string_dedent

`[%string_dedent STRING]` is identical to `[%string STRING]`, except
that it feeds `STRING` through
[`Dedent.string`](../../lib/dedent/README.mdx) before substitution.

For example:

    [%string_dedent 
      {|
      > a
      >  %{b}
      >   c
      >    %{d}
      >     %{e}
      |}]
      
is equivalent to:

    [%string {|a
     %{b}
      c
       %{d}
        %{e}|}]

# Enabling `[%string_dedent]`.

Add the following field to your `library` stanza:

    (preprocess (pps (ppx_jane ppx_string_dedent)))
  
# Why use `[%string_dedent]` rather than `[%string] |> Dedent.string`?

Use `[%string_dedent]` rather than this idiom:

    [%string {| ... |}] |> Dedent.string

which does the wrong thing, because it dedents after substitution.
