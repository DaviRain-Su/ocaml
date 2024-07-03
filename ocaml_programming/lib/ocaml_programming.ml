let rec sum = function
  | [] -> 0 (* wrong! *)
  | h::t -> h + sum t

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