open Asm

external gethi : float -> int32 = "gethi"
external getlo : float -> int32 = "getlo"

let float_table = ref []

let stackset = ref S.empty (* すでに Save された変数の集合 *)
let stackmap = ref [] (* Save された変数のスタックにおける位置 *)
let save x = 
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    stackmap := !stackmap @ [x]
let savef x = 
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    (let pad = 
       if List.length !stackmap mod 2 = 0 then [] else [Id.gentmp Type.Int] in
       stackmap := !stackmap @ pad @ [x; x])
let locate x = 
  let rec loc = function 
    | [] -> []
    | y :: zs when x = y -> 0 :: List.map succ (loc zs)
    | y :: zs -> List.map succ (loc zs) in
    loc !stackmap
let offset x = -4 * List.hd (locate x)
let stacksize () = (List.length !stackmap + 1) * 4

let reg r = 
  if is_reg r 
  then String.sub r 1 (String.length r - 1)
  else r 

(* 関数呼び出しのために引数を並べ替える (register shuffling) *)
let rec shuffle sw xys = 
  (* remove identical moves *)
  let (_, xys) = List.partition (fun (x, y) -> x = y) xys in
    (* find acyclic moves *)
    match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
      | ([], []) -> []
      | ((x, y) :: xys, []) -> (* no acyclic moves; resolve a cyclic move *)
          (y, sw) :: (x, y) :: 
            shuffle sw (List.map (function 
                                    | (y', z) when y = y' -> (sw, z)
                                    | yz -> yz) xys)
      | (xys, acyc) -> acyc @ shuffle sw xys

type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型 *)
let rec g oc = function (* 命令列のアセンブリ生成 *)
  | (dest, Ans (exp)) -> g' oc (dest, exp)
  | (dest, Let((x, t), exp, e)) -> g' oc (NonTail (x), exp); g oc (dest, e)
and g' oc = function (* 各命令のアセンブリ生成 *)
    (* 末尾でなかったら計算結果を dest にセット *)
  | (NonTail(_), Nop) -> ()
  | (NonTail(x), Li(i)) when i >= -32768 && i < 32768 -> 
      Printf.fprintf oc "\tli\t%s, %d\n" (reg x) i
  | (NonTail(x), Li(i)) ->
      let n = i lsr 16 in
      let m = i lxor (n lsl 16) in
      Printf.fprintf oc "\tlui\t%s, %d\n" (reg x) n;
      Printf.fprintf oc "\tori\t%s, %s, %d\n" (reg x) (reg x) m
  | (NonTail(x), FLi(l)) ->
      Printf.fprintf oc "\tfli\t%s, %s\n" (reg x) (string_of_float (List.assoc l !float_table))
  | (NonTail(x), SetL(Id.L(l))) -> 
      Printf.fprintf oc "\tll\t%s, %s\n" (reg x) l
  | (NonTail(x), Mr(y)) when x = y -> ()
  | (NonTail(x), Mr(y)) -> Printf.fprintf oc "\tmove\t%s, %s\n" (reg x) (reg y)
  | (NonTail(x), Neg(y)) -> Printf.fprintf oc "\tneg\t%s, %s\n" (reg x) (reg y)
  | (NonTail(x), Add(y, V(z))) -> 
      Printf.fprintf oc "\tadd\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Add(y, C(z))) -> 
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg x) (reg y) z
  | (NonTail(x), Sub(y, V(z))) -> 
      Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Sub(y, C(z))) -> 
      (* TODO: z must not be -32768 *)
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg x) (reg y) (-z)
  | (NonTail(x), Mul(y, z)) -> 
      Printf.fprintf oc "\tmul\t%s, %s\n" (reg y) (reg z);
      Printf.fprintf oc "\tmflo\t%s\n" (reg x)
  | (NonTail(x), Div(y, z)) -> 
      Printf.fprintf oc "\tdiv\t%s, %s\n" (reg y) (reg z);
      Printf.fprintf oc "\tmfhi\t%s\n" (reg x)
  | (NonTail(x), Slw(y, V(z))) -> 
      Printf.fprintf oc "\tsllv\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Slw(y, C(z))) -> 
      Printf.fprintf oc "\tsll\t%s, %s, %d\n" (reg x) (reg y) z
  | (NonTail(x), Lwz(y, V(z))) ->
      Printf.fprintf oc "\tlwx\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Lwz(y, C(z))) -> 
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" (reg x) z (reg y)
  | (NonTail(_), Stw(x, y, V(z))) ->
      Printf.fprintf oc "\tswx\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(_), Stw(x, y, C(z))) -> 
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" (reg x) z (reg y)
  | (NonTail(x), FMr(y)) when x = y -> ()
  | (NonTail(x), FMr(y)) -> Printf.fprintf oc "\tfmove\t%s, %s\n" (reg x) (reg y)
  | (NonTail(x), FAbs(y)) -> 
      Printf.fprintf oc "\tfabs\t%s, %s\n" (reg x) (reg y)
  | (NonTail(x), FNeg(y)) -> 
      Printf.fprintf oc "\tfneg\t%s, %s\n" (reg x) (reg y)
  | (NonTail(x), FSqr(y)) -> 
      Printf.fprintf oc "\tfmul\t%s, %s, %s\n" (reg x) (reg y) (reg y)
  | (NonTail(x), FSqrt(y)) -> 
      Printf.fprintf oc "\tfsqrt\t%s, %s\n" (reg x) (reg y)
  | (NonTail(x), FLess(y, z)) -> 
      Printf.fprintf oc "\tfclt\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), FIsPos(y)) -> 
      Printf.fprintf oc "\tfclt\t%s, f0, %s\n" (reg x) (reg y)
  | (NonTail(x), FIsNeg(y)) -> 
      Printf.fprintf oc "\tfclt\t%s, %s, f0\n" (reg x) (reg y)
  | (NonTail(x), FIsZero(y)) -> 
      Printf.fprintf oc "\tfcseq\t%s, %s, f0\n" (reg x) (reg y)
  | (NonTail(x), FAdd(y, z)) -> 
      Printf.fprintf oc "\tfadd\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), FSub(y, z)) -> 
      Printf.fprintf oc "\tfsub\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), FMul(y, z)) -> 
      Printf.fprintf oc "\tfmul\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), FDiv(y, z)) -> 
      Printf.fprintf oc "\tfdiv\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Lfd(y, V(z))) ->
      Printf.fprintf oc "\tlwfx\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(x), Lfd(y, C(z))) -> 
      Printf.fprintf oc "\tlwf\t%s, %d(%s)\n" (reg x) z (reg y)
  | (NonTail(_), Stfd(x, y, V(z))) ->
      Printf.fprintf oc "\tswfx\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | (NonTail(_), Stfd(x, y, C(z))) ->
      Printf.fprintf oc "\tswf\t%s, %d(%s)\n" (reg x) z (reg y)
  | (NonTail(_), Comment(s)) -> Printf.fprintf oc "#\t%s\n" s
  (* 退避の仮想命令の実装 *)
  | (NonTail(_), Save(x, y))
      when List.mem x allregs && not (S.mem y !stackset) ->
      save y;
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" (reg x) (offset y) reg_sp
  | (NonTail(_), Save(x, y)) 
      when List.mem x allfregs && not (S.mem y !stackset) ->
      save y;
      Printf.fprintf oc "\tswf\t%s, %d(%s)\n" (reg x) (offset y) reg_sp
  | (NonTail(_), Save(x, y)) -> assert (S.mem y !stackset); ()
  (* 復帰の仮想命令の実装 *)
  | (NonTail(x), Restore(y)) when List.mem x allregs ->
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" (reg x) (offset y) reg_sp
  | (NonTail(x), Restore(y)) ->
      assert (List.mem x allfregs);
      Printf.fprintf oc "\tlwf\t%s, %d(%s)\n" (reg x) (offset y) reg_sp
  (* 末尾だったら計算結果を第一レジスタにセット *)
  | (Tail, (Nop | Stw _ | Stfd _ | Comment _ | Save _ as exp)) ->
      g' oc (NonTail(Id.gentmp Type.Unit), exp);
      Printf.fprintf oc "\tjr\tr31\n";
  | (Tail, (Li _ | SetL _ | Mr _ | Neg _ | Add _ | Sub _ | Slw _ |
            Lwz _ | FLess (_, _) | FIsPos _ | FIsNeg _ | FIsZero _ as exp)) -> 
      g' oc (NonTail(regs.(0)), exp);
      Printf.fprintf oc "\tjr\tr31\n";
  | (Tail, (FLi _ | FMr _ | FAbs _ | FNeg _ | FSqr _ | FSqrt _ |
            FAdd _ | FSub _ | FMul _ | FDiv _ | Lfd _ as exp)) ->
      g' oc (NonTail(fregs.(0)), exp);
      Printf.fprintf oc "\tjr\tr31\n";
  | (Tail, (Restore(x) as exp)) -> assert false;
  (* TODO: reasoning return value type
      (match locate x with
         | [i] -> g' oc (NonTail(regs.(0)), exp)
         | [i; j] when (i + 1 = j) -> g' oc (NonTail(fregs.(0)), exp)
         | _ -> assert false);
      Printf.fprintf oc "\tjr\tr31\n";
  *)
  | (Tail, IfEq(x, V(y), e1, e2)) ->
      g'_tail_if oc x y e1 e2 "beq" "bne"
  | (Tail, IfEq(x, C(_), e1, e2)) ->
      g'_tail_if oc x "" e1 e2 "beq" "bne"
  | (Tail, IfLE(x, V(y), e1, e2)) ->
      g'_tail_if oc x y e1 e2 "ble" "bgt"
  | (Tail, IfLE(x, C(_), e1, e2)) ->
      g'_tail_if oc x "" e1 e2 "ble" "bgt"
  | (Tail, IfGE(x, V(y), e1, e2)) ->
      g'_tail_if oc x y e1 e2 "bge" "blt"
  | (Tail, IfGE(x, C(_), e1, e2)) ->
      g'_tail_if oc x "" e1 e2 "bge" "blt"
  | (Tail, IfFEq(x, y, e1, e2)) ->
      g'_tail_if oc x y e1 e2 "fbeq" "fbne"
  | (Tail, IfFLE(x, y, e1, e2)) ->
      g'_tail_if oc x y e1 e2 "fble" "fbgt"
  | (NonTail(z), IfEq(x, V(y), e1, e2)) ->
      g'_non_tail_if oc (NonTail(z)) x y e1 e2 "beq" "bne"
  | (NonTail(z), IfEq(x, C(_), e1, e2)) ->
      g'_non_tail_if oc (NonTail(z)) x "" e1 e2 "beq" "bne"
  | (NonTail(z), IfLE(x, V(y), e1, e2)) ->
      g'_non_tail_if oc (NonTail(z)) x y e1 e2 "ble" "bgt"
  | (NonTail(z), IfLE(x, C(_), e1, e2)) ->
      g'_non_tail_if oc (NonTail(z)) x "" e1 e2 "ble" "bgt"
  | (NonTail(z), IfGE(x, V(y), e1, e2)) ->
      g'_non_tail_if oc (NonTail(z)) x y e1 e2 "bge" "blt"
  | (NonTail(z), IfGE(x, C(_), e1, e2)) ->
      g'_non_tail_if oc (NonTail(z)) x "" e1 e2 "bge" "blt"
  | (NonTail(z), IfFEq(x, y, e1, e2)) ->
      g'_non_tail_if oc (NonTail(z)) x y e1 e2 "fbeq" "fbne"
  | (NonTail(z), IfFLE(x, y, e1, e2)) ->
      g'_non_tail_if oc (NonTail(z)) x y e1 e2 "fble" "fbgt"
  (* 関数呼び出しの仮想命令の実装 *)
  | (Tail, CallCls(x, ys, zs)) -> (* 末尾呼び出し *)
      g'_args oc [(x, reg_cl)] ys zs;
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_tmp (reg reg_cl);
      Printf.fprintf oc "\tjr\t%s\n" reg_tmp
  | (Tail, CallDir(Id.L(x), ys, zs)) -> (* 末尾呼び出し *)
      g'_args oc [] ys zs;
      Printf.fprintf oc "\tj\t%s\n" x
  | (NonTail(a), CallCls(x, ys, zs)) ->
      g'_args oc [(x, reg_cl)] ys zs;
      let ss = stacksize () in
        Printf.fprintf oc "\tsw\t%s, %d(%s)\n" reg_ra (4 - ss) reg_sp;
        Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp (-ss);
        Printf.fprintf oc "\tlw\t%s, 0(%s)\n" reg_tmp (reg reg_cl);
        Printf.fprintf oc "\tjalr\t%s\n" reg_tmp;
        Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp ss;
        Printf.fprintf oc "\tlw\t%s, %d(%s)\n" reg_ra (4 - ss) reg_sp;
        (if List.mem a allregs && a <> regs.(0) then
           Printf.fprintf oc "\tmove\t%s, %s\n" (reg a) (reg regs.(0))
         else if List.mem a allfregs && a <> fregs.(0) then
           Printf.fprintf oc "\tfmove\t%s, %s\n" (reg a) (reg fregs.(0)));
  | (NonTail(a), CallDir(Id.L(x), ys, zs)) -> 
      g'_args oc [] ys zs;
      let ss = stacksize () in
        Printf.fprintf oc "\tsw\t%s, %d(%s)\n" reg_ra (4 - ss) reg_sp;
        Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp (-ss);
        Printf.fprintf oc "\tjal\t%s\n" x;
        Printf.fprintf oc "\taddi\t%s, %s, %d\n" reg_sp reg_sp ss;
        Printf.fprintf oc "\tlw\t%s, %d(%s)\n" reg_ra (4 - ss) reg_sp;
        (if List.mem a allregs && a <> regs.(0) then
           Printf.fprintf oc "\tmove\t%s, %s\n" (reg a) (reg regs.(0))
         else if List.mem a allfregs && a <> fregs.(0) then
           Printf.fprintf oc "\tfmove\t%s, %s\n" (reg a) (reg fregs.(0)));
and g'_tail_if oc x y e1 e2 b bn = 
  let b_else = Id.genid (b ^ "_else") in
    (if y = "" then
       Printf.fprintf oc "\t%sz\t%s, %s\n" bn (reg x) b_else
     else
       Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn (reg x) (reg y) b_else);
    let stackset_back = !stackset in
      g oc (Tail, e1);
      Printf.fprintf oc "%s:\n" b_else;
      stackset := stackset_back;
      g oc (Tail, e2)
and g'_non_tail_if oc dest x y e1 e2 b bn = 
  let b_else = Id.genid (b ^ "_else") in
  let b_cont = Id.genid (b ^ "_cont") in
    (if y = "" then
       Printf.fprintf oc "\t%sz\t%s, %s\n" bn (reg x) b_else
     else
       Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn (reg x) (reg y) b_else);
    let stackset_back = !stackset in
      g oc (dest, e1);
      let stackset1 = !stackset in
        Printf.fprintf oc "\tj\t%s\n" b_cont;
        Printf.fprintf oc "%s:\n" b_else;
        stackset := stackset_back;
        g oc (dest, e2);
        Printf.fprintf oc "%s:\n" b_cont;
        let stackset2 = !stackset in
          stackset := S.inter stackset1 stackset2
and g'_args oc x_reg_cl ys zs = 
  let (i, yrs) = 
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl) ys in
    List.iter
      (fun (y, r) -> Printf.fprintf oc "\tmove\t%s, %s\n" (reg r) (reg y))
      (shuffle reg_sw yrs);
    let (d, zfrs) = 
      List.fold_left
        (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
        (0, []) zs in
      List.iter
        (fun (z, fr) -> Printf.fprintf oc "\tfmove\t%s, %s\n" (reg fr) (reg z))
        (shuffle reg_fsw zfrs)

let h oc { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
  Printf.fprintf oc "%s:\n" x;
  stackset := S.empty;
  stackmap := [];
  g oc (Tail, e)

let f oc (Prog(data, fundefs, e)) =
  float_table := data;
  Format.eprintf "generating assembly...@.";
  Printf.fprintf oc "\tj\t_min_caml_start\n";
  List.iter (fun fundef -> h oc fundef) fundefs;
  Printf.fprintf oc "_min_caml_start: # main entry point\n";
  Printf.fprintf oc "\taddi\tr29, r0, 1\n";
  Printf.fprintf oc "\tsll\tr29, r29, 20\n";
  Printf.fprintf oc "\taddi\tr30, r29, 4\n";
  Printf.fprintf oc "   # main program start\n";
  stackset := S.empty;
  stackmap := [];
  g oc (NonTail("_R_0"), e);
  Printf.fprintf oc "   # main program end\n";
  Printf.fprintf oc "\thalt\n";
