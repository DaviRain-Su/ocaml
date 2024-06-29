(*** 注释 ***)

(*
  在OCaml中，注释是用 (* 和 *) 来包围的。OCaml支持嵌套注释，这意味着你可以在一个注释块中包含另一个注释块
*)

(*
  这是一个嵌套注释的示例
  (* 这是嵌套的注释 *)
  这里是外层注释的继续
*)

(*
  在OCaml中，确实没有单行注释的语法。所有的注释都使用 (* ... *) 的形式，并且可以跨多行
*)

(*** 变量与函数 ***)

(*
  在OCaml中，表达式可以用双分号 ;; 来分隔。在许多情况下，这种用法是多余的，但在一些教程中，
  为了方便将代码粘贴到解释器（REPL）中，会在每个表达式后使用 ;;。
  然而，在实际的源代码文件中，不必要地使用表达式分隔符通常被认为是不好的编程风格。
*)

(*
  在OCaml中，变量和函数的声明使用 let 关键字。这使得OCaml的声明语法非常简洁和一致。
*)
(*
  在OCaml中，变量默认是不可变的（immutable）。这意味着一旦为变量赋值，就不能再改变它的值。这种不可变性有助于确保程序的正确性和可预测性。
*)
let x = 10;;
(* print_endline (string_of_int x);; *)
Printf.printf "x = %d\n" x;;

(*
  在OCaml中，变量名可以包含字母、数字和下划线字符，但必须以字母或下划线字符开头。
  另外，OCaml对大小写敏感，因此变量名中的大小写字符是有区别的。
*)

(*
  OCaml确实允许在标识符中使用单引号字符。在这种情况下，单引号并没有特殊含义，它通常用于那些在其他语言中会使用诸如“foo_tmp”之类名字的情况。
*)
let foo = 1;;
let foo' = foo * 2;;
(* print_endline (string_of_int foo');; *)
Printf.printf "foo' = %d\n" foo';;

(*
  在OCaml中，编译器能够自动推断类型，因此通常不需要显式指定参数类型。然而，如果你希望或需要，你也可以显式地指定参数类型。
*)
let inc_int (x: int): int = x + 1;;
(* print_endline (string_of_int (inc_int 1));; *)
Printf.printf "inc_int 1 = %d\n" (inc_int 1);;

(*
  确实，在某些情况下，显式类型注解是必要的，特别是在解决两个具有相同字段名称的记录类型之间的歧义时。
  另一种选择是将这些类型封装在模块中，但这两个主题都超出了本教程的讨论范围。
*)

(*
  在OCaml中，递归函数定义需要使用 rec 关键字进行标记。
    这是因为OCaml采用了静态作用域规则，为了明确表示一个函数是递归的，需要显式地使用 rec 关键字。
*)
let rec factorial n =
  if n = 0 then 1
  else n * factorial (n - 1);;
(* print_endline (string_of_int (factorial 5));; *)
Printf.printf "factorial 5 = %d\n" (factorial 5);;

(*
  在OCaml中，函数是一等公民，这意味着函数可以作为参数传递给其他函数，也可以作为返回值返回。
  这种特性使得OCaml非常适合函数式编程范式，因为函数可以被视为数据，可以被操作和组合。
*)

(*
  在OCaml中，函数应用通常不需要在参数周围使用括号。这使得函数调用的语法更加简洁和自然。
*)
let fact_5 = factorial 5;;
(* print_endline (string_of_int fact_5);; *)
Printf.printf "factorial 5 = %d\n" fact_5;;

(*
  正确，在OCaml中，函数应用通常不需要在参数周围使用括号，除非参数是一个表达式。在这种情况下，使用括号可以明确表达式的边界，避免歧义。
*)
let fact_4 = factorial (2 + 2);;
(* print_endline (string_of_int fact_4);; *)
Printf.printf "factorial 4 = %d\n" fact_4;;

(*
  在OCaml中，函数可以有多个参数，这些参数可以用空格分隔。这种语法使得函数调用更加简洁和自然。
*)

(*
  在OCaml中，每个函数必须至少有一个参数。然而，有些函数在概念上不需要任何参数。
  为了处理这种情况，OCaml提供了一个特殊的类型，称为 unit 类型。unit 类型只有一个值，写作 ()。
*)
let print_hello () = print_endline "Hello, World!";;

(*
  在OCaml中，当调用一个接受 unit 类型参数的函数时，你必须显式地传递 () 作为参数。这是因为 unit 类型表示“无实际值”，但仍然需要满足函数签名的要求。
*)
print_hello () ;;

(*
  在OCaml中，函数调用是柯里化（currying）的，这意味着每个函数实际上只接受一个参数，并返回一个新的函数，该函数接受下一个参数。
  由于这种特性，当你调用一个函数但提供的参数不足时，不会导致错误，而是返回一个新的函数，等待剩余的参数。
*)
let make_inc x y = x + y;; (* make_inc is int -> int -> int *)
let inc_2 = make_inc 2;; (* inc_2 is int -> int *)
(* print_endline (string_of_int (inc_2 3));; *)
Printf.printf "inc_2 3 = %d\n" (inc_2 3);;

(*
  在OCaml中，函数调用是柯里化的，这意味着每个函数实际上只接受一个参数，并返回一个新的函数，该函数接受下一个参数。
  由于这种特性，你可以使用部分应用（partial application）来创建新的函数，这是一种非常强大的技术。
*)

(*
  在OCaml中，函数体可以包含多个表达式，其中最后一个表达式的值将作为函数的返回值。
  所有其他的表达式必须是 unit 类型。这种特性在编写命令式风格代码时非常有用，例如插入调试打印语句。
*)
let print_and_return x =
  print_endline (string_of_int x);
  x
;;
(* print_endline (string_of_int (print_and_return 42));; *)
Printf.printf "print_and_return 42 = %d\n" (print_and_return 42);;

(*
  在OCaml中，函数体可以包含多个表达式，其中最后一个表达式的值将作为函数的返回值。
  所有其他的表达式必须是 unit 类型。这种特性在编写命令式风格代码时非常有用，例如插入调试打印语句。
*)

(*
  在OCaml中，作为一种函数式编程语言，确实没有传统意义上的“过程”或者“子程序”。
  每个函数都必须返回一个值。对于那些主要是为了副作用而调用的函数，例如 print_endline，它们返回一个 unit 类型的值。
*)

(*
  在OCaml中，可以使用 let ... in 结构来链式定义多个变量，然后在表达式中使用它们。
  这类似于在命令式语言中将值赋给多个变量，然后在表达式中使用这些变量。
*)
let z = let x = 10 in
let y = 20 in
x + y;;
(* print_endline (string_of_int z);; *)
Printf.printf "z = %d\n" z;;

(*
  在OCaml中，可以使用 let ... in 结构来链式定义多个变量，然后在表达式中使用它们。
  这类似于在命令式语言中将值赋给多个变量，然后在表达式中使用这些变量。
*)

(*
  在OCaml中，除了使用链式的 let ... in 结构，还可以使用 let ... and ... in 结构来同时定义多个变量或函数。
  这在定义相互递归的函数时特别有用，因为使用普通的 let ... in 结构会导致编译器报错，指出存在未绑定的值。
*)
let rec
  is_even n = n = 0 || is_odd (n - 1)
and
  is_odd n = n <> 0 && is_even (n - 1);; (* 在OCaml中，<> 是不等于操作符，用于比较两个值是否不相等。它类似于其他编程语言中的 != 操作符。 *)
(* print_endline (string_of_bool (is_even 5));; *)
Printf.printf "is_even 5 = %b\n" (is_even 5);;


(*
解释:
  is_even 函数：
    如果 n 等于 0，则返回 true（n = 0）。
    否则，调用 is_odd 函数，传递 n - 1 作为参数。
  is_odd 函数：
    如果 n 不等于 0（n <> 0），则返回 true，并递归调用 is_even 函数，传递 n - 1 作为参数。
    否则，返回 false。
*)

(*
let rec
  is_even = function
    | 0 -> true
    | n -> is_odd (n - 1)
and
  is_odd = function
    | 0 -> false
    | n -> is_even (n - 1)
;;
*)

(* 在OCaml中，匿名函数（也称为lambda表达式）*)
let my_lambda = fun x -> x * x;;
(* print_endline (string_of_int (my_lambda 5));; *)
Printf.printf "my_lambda 5 = %d\n" (my_lambda 5);;

(*
  在OCaml中，匿名函数的语法是 fun x -> expr，其中 x 是参数，expr 是函数体。
  与普通函数不同，匿名函数不需要显式地指定参数类型，因为OCaml可以从上下文中推断出参数类型。
  但是，如果你想显式地指定参数类型，可以使用括号将参数类型括起来，例如 fun (x: int) -> expr。
*)

(*** 操作符 ***)

(*
  在OCaml中，操作符和函数之间的区别很小。实际上，每个操作符都可以作为函数调用。
  这种特性使得OCaml的操作符非常灵活，可以在需要函数的上下文中使用操作符。
*)

(+) 3 4 (* Same as 3 + 4 *);;
Printf.printf "3 + 4 = %d\n" ((+) 3 4);;

(*
  在OCaml中，操作符和函数之间的区别很小。实际上，每个操作符都可以作为函数调用。
  这种特性使得OCaml的操作符非常灵活，可以在需要函数的上下文中使用操作符。
*)

(*
  在OCaml中，整数和浮点数之间没有隐式转换。更有趣的是，OCaml使用不同的操作符来处理浮点数运算。
  这种设计决策有助于避免由于类型转换而导致的潜在错误，并确保程序的类型安全性。
*)

(* 12 + 3;; (* int addition *) *)
Printf.printf "12 + 3 = %d\n" (12 + 3);;
(* 12.0 +. 3.0;; (* float addition *) *)
Printf.printf "12.0 + 3.0 = %f\n" (12.0 +. 3.0);;
(* 12 / 3 ;; (* Integer division. *) *)
Printf.printf "12 / 3 = %d\n" (12 / 3);;
(* 12.0 /. 3.0 ;; (* Floating point division. *) *)
Printf.printf "12.0 / 3.0 = %f\n" (12.0 /. 3.0);;
(* 5 mod 2 ;; (* Remainder. *) *)
Printf.printf "5 mod 2 = %d\n" (5 mod 2);;


(*
  在OCaml中，一元负号（unary minus）是一个显著的例外，它是多态的。
  这意味着你可以使用相同的 - 操作符来表示整数和浮点数的负值。
  然而，OCaml也提供了专门用于整数和浮点数的一元负号形式。
*)
(* - 3 ;; (* Polymorphic, integer *) *)
Printf.printf "-3 = %d\n" (- 3);;
- 4.5 ;; (* Polymorphic, float *)
Printf.printf "-4.5 = %f\n" (- 4.5);;
(* ~- 3 (* Integer only *) *)
Printf.printf "~-3 = %d\n" (~- 3);;
(* ~- 3.4 (* Type error *) *)
(* Printf.printf "~- 3.4 = %f\n" ( ~- 3.4);; *)
(* ~-. 3.4 (* Float only *);; *)
Printf.printf "~-.3.4 = %f\n" ( ~-. 3.4);;

(*
  在OCaml中，你可以定义自己的操作符或重新定义现有的操作符。
  与Standard ML或Haskell不同，OCaml中只有某些符号可以用于操作符名称，
  并且操作符的首个符号决定了其结合性和优先级规则。
*)
let (+) a b = a - b ;; (* Surprise maintenance programmers. *)
(* print_endline (string_of_int (3 + 4));; *)
Printf.printf "3 + 4 = %d\n" (3 + 4);;

(*
  定义一个用于浮点数的倒数操作符是一个非常实用的例子。在OCaml中，一元操作符必须以 ~ 开头，因此我们可以定义一个新的操作符 ~% 来表示浮点数的倒数。
*)
let (~/) x = 1.0 /. x ;;
(* ~/4.0 (* = 0.25 *);; *)
(* print_endline (string_of_float (~/4.0));; *)
Printf.printf "~/.4.0 = %f\n" (~/4.0);;

(*** Built-in data structures ***)

(*
  在OCaml中，列表（Lists）使用方括号 [] 括起来，列表项之间用分号 ; 分隔。
*)
let my_list = [1; 2; 3; 4; 5];; (* Has type "int list" *)
(* print_endline (string_of_int (List.length my_list));; *)
Printf.printf "List.length my_list = %d\n" (List.length my_list);;

(* 打印每个元素 *)
List.iter (fun x -> Printf.printf "%d " x) my_list;;

(*
在OCaml中，元组（Tuples）可以（可选地）用圆括号 () 括起来，元组中的项用逗号 , 分隔。元组是一种固定大小、不同类型的集合。
*)
let first_tuple = 3, 4;; (* Has type "int * int" *)
let second_tuple = (3, 4);;

(* let third_tuple = (3, "hello", 4.5);; (* Has type "int * string * float" *) *)
(* print_endline (string_of_int (fst first_tuple));; *)
(* print_endline (string_of_int (snd first_tuple));; *)
(* print_endline (string_of_int (fst second_tuple));; *)
(* print_endline (string_of_int (snd second_tuple));; *)
(* 打印元组 *)
Printf.printf "fst first_tuple = %d\n" (fst first_tuple);;
Printf.printf "snd first_tuple = %d\n" (snd first_tuple);;
Printf.printf "fst second_tuple = %d\n" (fst second_tuple);;
Printf.printf "snd second_tuple = %d\n" (snd second_tuple);;


(*
  在OCaml中，如果你尝试用逗号 , 来分隔列表项，你将得到一个包含元组的列表，这通常不是你所期望的结果。
*)
let bad_list = [1, 2; 3, 4];; (* Has type "(int * int) list" *)
(* print_endline (string_of_int (List.length bad_list));; *)
Printf.printf "List.length bad_list = %d\n" (List.length bad_list);;

(* 打印每个元组 *)

List.iter (fun (x, y) -> Printf.printf "(%d, %d) " x y) bad_list;;


(*
  如果你尝试将一个元组模式匹配到一个列表中，你将得到一个类型错误。
  为了匹配一个元组，你需要将其括起来，就像你在定义元组时所做的那样。
*)

Printf.printf "\n"

let incorrect_list = [1, 2, 3]

(* 打印两个列表 *)
let () =
  match incorrect_list with
  | [(a, b, c)] -> Printf.printf "Incorrect list: (%d, %d, %d)\n" a b c
  | _ -> Printf.printf "Incorrect list does not match expected pattern\n"

(*
  在OCaml中，数组（Arrays）使用 [| 和 |] 括起来，数组项之间用分号 ; 分隔。
  与列表不同，数组是可变的，这意味着你可以在数组中添加、删除或更新元素。
*)
