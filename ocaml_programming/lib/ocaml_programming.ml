let rec sum = function
  | [] -> 0 (* wrong! *)
  | h::t -> h + sum t

let rec length = function
  | [] -> 0
  | _ :: t -> 1 + length t

let rec append lst1 lst2 =
  match lst1 with
  | [] -> lst2
  | h :: t -> h :: append t lst2

(*
  let empty = function
    | [] -> true
    | _ :: _ -> false
*)
let empty lst =
  lst = []

type day = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday


let next_weekday d =
  match d with
  | Monday -> Tuesday
  | Tuesday -> Wednesday
  | Wednesday -> Thursday
  | Thursday -> Friday
  | Friday -> Monday
  | Saturday -> Monday
  | Sunday -> Monday
