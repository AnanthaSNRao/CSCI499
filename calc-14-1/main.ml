let _ =
  match Myparser.prog Mylexer.read (Lexing.from_channel stdin) with
  | Some e -> e |> Expr.eval |> print_int
  | None -> ()

let _ =
  print_endline ""