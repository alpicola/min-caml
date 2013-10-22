type t = (* MinCamlの構文を表現するデータ型 (caml2html: syntax_t) *)
  | Unit
  | Bool of bool
  | Int of int
  | Float of float
  | Not of t
  | Neg of t
  | Add of t * t
  | Sub of t * t
  | FNeg of t
  | FAdd of t * t
  | FSub of t * t
  | FMul of t * t
  | FDiv of t * t
  | Eq of t * t
  | LE of t * t
  | If of t * t * t
  | Let of (Id.t * Type.t) * t * t
  | Var of Id.t
  | LetRec of fundef * t
  | App of t * t list
  | Tuple of t list
  | LetTuple of (Id.t * Type.t) list * t * t
  | Array of t * t
  | Get of t * t
  | Put of t * t * t
and fundef = { name : Id.t * Type.t; args : (Id.t * Type.t) list; body : t }

let pp e =
  let paren s = "(" ^ s ^ ")" in
  let ppn (x, t) = x ^ ":" ^ Type.pp t in
  let rec f i e = String.make i ' ' ^ match e with
    | Unit -> "Unit"
    | Bool b -> "Bool" ^ paren (string_of_bool b)
    | Int i -> "Int" ^ paren (string_of_int i)
    | Float f -> "Float" ^ paren (string_of_float f)
    | Not e -> "Not\n" ^ f (i + 2) e
    | Neg e -> "Neg\n" ^ f (i + 2) e
    | Add (e1, e2) -> "Add\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | Sub (e1, e2) -> "Sub\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | FNeg e -> "FNeg\n" ^ f (i + 2) e
    | FAdd (e1, e2) -> "FAdd\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | FSub (e1, e2) -> "FSub\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | FMul (e1, e2) -> "FMul\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | FDiv (e1, e2) -> "FDiv\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | Eq (e1, e2) -> "Eq\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | LE (e1, e2) -> "LE\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | If (e1, e2, e3) ->
        "If\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2 ^ "\n" ^ f (i + 2) e3
    | Let (n, e1, e2) ->
        "Let" ^ paren (ppn n) ^ "\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | Var x -> "Var" ^ paren x
    | LetRec({ name = n; args = ns; body = e1 }, e2) ->
        "LetRec" ^ paren (String.concat ", " (List.map ppn (n :: ns))) ^
        "\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | App (e, es) -> "App\n" ^ String.concat "\n" (List.map (f (i + 2)) (e :: es))
    | Tuple es -> "Tuple\n" ^ String.concat "\n" (List.map (f (i + 2)) es)
    | LetTuple (ns, e1, e2) ->
        "LetTuple" ^ paren (String.concat ", " (List.map ppn ns)) ^
        "\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | Array (e1, e2) -> "Array\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | Get (e1, e2) -> "Get\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2
    | Put (e1, e2, e3) ->
        "Put\n" ^ f (i + 2) e1 ^ "\n" ^ f (i + 2) e2 ^ "\n" ^ f (i + 2) e3
  in f 0 e
