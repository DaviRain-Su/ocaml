open Base
(* chapter 1 *)

let square x = x * x

(*
let ratio x y = 
  Float.of_int x /. Float.of_int y
*)


(*
let ratio x y =
  let open Float.O in
  of_int x / of_int y;;

let ratio x y =
  Float.O.(of_int x / of_int y);;
*)

let sum_if_true (test: int -> bool) (first: int) (second: int): int = 
  (if test first then first else 0)
  + (if test second then second else 0)

let first_if_true test x y = 
  if test x then x else y

(*
  let distance (x1, y1) (x2, y2) = 
    Float.sqrt ((x1 -. x2) **. 2. +. (y1 -. y2) **. 2.) 
*)

let my_favorite_language languages = 
  match languages with 
  | first :: _ -> first
  | [] -> "OCaml" (* default value *)

let rec sum l = 
  match l with 
  | [] -> 0
  | hd :: tl -> hd + sum tl

let rec remove_sequential_duplicates list = 
  match list with 
  | [] -> []
  | [x] -> [x]
  | first :: second :: tl -> 
    if first = second then 
      remove_sequential_duplicates  (second :: tl)
    else
      first :: remove_sequential_duplicates (second :: tl)


let divide x y = 
  if y = 0 then None else Some( x / y)
  

let downcase_extension filename = 
  match String.rsplit2 filename ~on:'.' with 
  | None -> filename
  | Some (base, ext) -> base ^ "." ^ String.lowercase ext

type point2d = { x: float; y: float }

let magnitude { x; y} = Float.sqrt (x **. 2. +. y **. 2.)

let distance  v1 v2 = 
  magnitude { x = v1.x -. v2.x; y = v1.y -. v2.y}

type cicle_desc = { center: point2d; radius: float }
type rect_desc = { lower_left: point2d; width: float; height: float }
type segment_desc = {endpoint1: point2d; endpoint2: point2d}

type scene_element = 
  | Circle of cicle_desc
  | Rect of rect_desc
  | Segment of segment_desc

let is_inside_scene_element point scene_element =
  let open Float.O in
  match scene_element with
  | Circle { center; radius } ->
    distance center point < radius
  | Rect { lower_left; width; height } ->
    point.x    > lower_left.x && point.x < lower_left.x + width
    && point.y > lower_left.y && point.y < lower_left.y + height
  | Segment _ -> false

let is_inside_scene point scene =
  List.exists scene
    ~f:(fun el -> is_inside_scene_element point el)


let rec read_and_accumulate accum =
  let line = In_channel.input_line In_channel.stdin in
  match line with
  | None -> accum
  | Some x -> read_and_accumulate (accum +. Float.of_string x)


(*** chapter2 变量和函数 ***)

(*** 变量 ***)


(* 
  声明变量绑定
  
  let <variable> = <expr> 

  每个变量绑定都有一个作用域，即可以引用该绑定的代码部分。
  当使用 utop 时，顶层 let 绑定的作用域是会话中跟随它的所有内容。当它出现在模块中时，作用域是该模块的其余部分。

  open Base;;
  let x = 3;;
  let y = 4;;
  let z = x + y;;

*)

let languages = "OCaml,Rust,Python"
let dashed_languages = 
  let languages = String.split ~on:',' languages  in
  String.concat ~sep:"-" languages

let plusone = fun x -> x + 1;; (* same to let plusone x = x + 1 *)

let area_of_ring ~inner_radius ~out_radius = 
  let pi = Float.pi in 
  let area_of_circle r = pi *. r **. 2. in
  area_of_circle out_radius -. area_of_circle inner_radius


let ratio ~num ~denom = Float.of_int num /. Float.of_int denom

(*
  函数和 let 绑定之间有很多关系。在某种意义上，您可以将函数的参数视为绑定到调用者传递的值的变量。

  (fun x -> x + 1) 7;;

  let x = 7 in x + 1;;
*)

(*
  let abs_diff x y = abs (x - y);;
  
  same to 

  let abs_diff = (fun x -> (fun y -> abs (x - y)));;

  let abs_diff = (fun x y -> abs (x - y));;

*)

(*
  OCaml 在很大程度上区分非递归定义（使用 let ）和递归定义（使用 let rec ）主要是出于技术原因：
  类型推断算法需要知道一组函数定义是否相互递归，而这些必须由程序员明确标记。
*)