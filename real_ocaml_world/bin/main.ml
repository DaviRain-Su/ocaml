open Real_ocaml_world

let () = print_endline "Hello, World!"

let () = print_endline (string_of_int (5 |> square |> square))

let () = print_endline (string_of_float (ratio ~num:3 ~denom:4))

let even x = 
  x mod 2 = 0

let () = print_endline (string_of_int (sum_if_true even 2 4))

let () = print_endline (string_of_int (first_if_true even 3 4))

let long_string s = String.length s > 6

let () = print_endline (first_if_true long_string "short" "loooooong")

let big_number x = x > 3

let () = print_endline (string_of_int (first_if_true big_number 2 4))

(* let () = print_endline (string_of_float (distance (1., 2.) (4., 6.))) *)

let () = print_endline (my_favorite_language ["OCaml"; "Rust"; "Python"])

let () = print_endline (my_favorite_language [])

let () = print_endline (string_of_int (sum [1; 2; 3; 4; 5]))

let () = List.iter (fun x -> Printf.printf "%d " x) (remove_sequential_duplicates [1; 1; 2; 3; 3; 4; 5; 5; 5; 6; 7; 8; 8; 9; 9; 9; 9; 10])

let () = print_endline ""

(* let () = print_endline (string_of_int (Option.value (divide 10 2) ~default:0)) *)

let () = Printf.printf "%d\n" (Option.value (divide 10 0) ~default:0)


let () = print_endline (downcase_extension "hello.TXT")

let () = List.iter (fun x -> Printf.printf "%s " x) (List.map downcase_extension [ "Hello_World.TXT"; "Hello_World.txt"; "Hello_World" ] );;

let () = print_endline ""

(* Distante p1 with p2 *)
let p1 = { x = 1.; y = 2. }
let p2 = { x = 4.; y = 6. }

let () = print_endline (string_of_float (distance p1 p2))

let () = print_endline (string_of_bool 
  (is_inside_scene {x=3.;y=7.} [ Circle {center = {x=4.;y= 4.}; radius = 0.5 } ]))

let () = print_endline (string_of_bool (is_inside_scene {x=3.;y=7.}
  [ Circle {center = {x=4.;y= 4.}; radius = 5.0 } ]))


  (*
let () =
  Printf.printf "Total: %F\n" (read_and_accumulate 0.)
*)

let () = Printf.printf "%d \n" (plusone 1)


let () = Printf.printf "%s\n" dashed_languages

let () = Printf.printf "area_of_ring 1. 3. is %s\n" (string_of_float (area_of_ring ~inner_radius:1. ~out_radius:3.))