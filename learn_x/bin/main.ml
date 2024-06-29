(*** Comments ***)
(* Comments are enclosed in (* and *). It's fine to nest comments. *)

(* There are no single-line comments. *)

(*** Variables  and functions ***)

(* Expressions can be separated by a double semicolon ";;".
   In many cases it's redundant, but in this tutorial we use it after
   every expression for easy pasting into the interpreter shell.
   Unnecessary use of expression separators in source code files
   is often considered to be a bad style. *)

(* Variable and function declarations use the "let" keyword. *)
(* Variables are immutable by default in OCaml *)
let x = 10;;

(* let () = print_endline ;; *)

print_endline (string_of_int x);;

(* Functions are declared using the "let" keyword followed by the function name and its arguments. *)

let () = print_endline "Hello, World!"
