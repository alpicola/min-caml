type t = (* MinCamlの型を表現するデータ型 (caml2html: type_t) *)
  | Unit
  | Bool
  | Int
  | Float
  | Fun of t list * t (* arguments are uncurried *)
  | Tuple of t list
  | Array of t
  | Var of t option ref

let gentyp () = Var(ref None) (* 新しい型変数を作る *)

let rec pp = function
  | Unit -> "unit"
  | Bool -> "bool"
  | Int -> "int"
  | Float -> "float"
  | Fun (ts, t) -> "(" ^ String.concat ", " (List.map pp ts) ^ ") -> " ^ pp t
  | Tuple ts -> "(" ^ String.concat " * " (List.map pp ts) ^ ")"
  | Array t -> pp t ^ " array"
  | Var r -> match !r with Some t -> pp t | None -> "none"
