(*** Comments ***)

(* 在OCaml中，注释是用 (* 和 *) 来包围的。OCaml支持嵌套注释，这意味着你可以在一个注释块中包含另一个注释块 *)

(* 这是一个嵌套注释的示例
   (* 这是嵌套的注释 *)
   这里是外层注释的继续 *)

(* 在OCaml中，确实没有单行注释的语法。所有的注释都使用 (* ... *) 的形式，并且可以跨多行 *)

(*** 变量与函数 ***)

(* 在OCaml中，表达式可以用双分号 ;; 来分隔。在许多情况下，这种用法是多余的，但在一些教程中，
  为了方便将代码粘贴到解释器（REPL）中，会在每个表达式后使用 ;;。
  然而，在实际的源代码文件中，不必要地使用表达式分隔符通常被认为是不好的编程风格。 *)

(* 在OCaml中，变量和函数的声明使用 let 关键字。这使得OCaml的声明语法非常简洁和一致。 *)
(* 在OCaml中，变量默认是不可变的（immutable）。这意味着一旦为变量赋值，就不能再改变它的值。这种不可变性有助于确保程序的正确性和可预测性。 *)
let x = 10;;
print_endline (string_of_int x);;

(* OCaml确实允许在标识符中使用单引号字符。在这种情况下，单引号并没有特殊含义，它通常用于那些在其他语言中会使用诸如“foo_tmp”之类名字的情况。 *)

let foo = 1;;
let foo' = foo * 2;;
print_endline (string_of_int foo');;

(* 在OCaml中，编译器能够自动推断类型，因此通常不需要显式指定参数类型。然而，如果你希望或需要，你也可以显式地指定参数类型。 *)
let inc_int (x: int): int = x + 1;;
print_endline (string_of_int (inc_int 1));;

(* 确实，在某些情况下，显式类型注解是必要的，特别是在解决两个具有相同字段名称的记录类型之间的歧义时。
  另一种选择是将这些类型封装在模块中，但这两个主题都超出了本教程的讨论范围。 *)

(* 在OCaml中，递归函数定义需要使用 rec 关键字进行标记。这是因为OCaml采用了静态作用域规则，为了明确表示一个函数是递归的，需要显式地使用 rec 关键字。 *)
let rec factorial n =
  if n = 0 then 1
  else n * factorial (n - 1);;
print_endline (string_of_int (factorial 5));;

(* 在OCaml中，函数应用通常不需要在参数周围使用括号。这使得函数调用的语法更加简洁和自然。 *)
let fact_5 = factorial 5;;
print_endline (string_of_int fact_5);;

(* 正确，在OCaml中，函数应用通常不需要在参数周围使用括号，除非参数是一个表达式。在这种情况下，使用括号可以明确表达式的边界，避免歧义。 *)
let fact_4 = factorial (2 + 2);;
(* let sqr2 = sqr (-2);; *)
print_endline (string_of_int fact_4);;
(* print_endline (string_of_int sqr2);; *)

(* 在OCaml中，每个函数必须至少有一个参数。然而，有些函数在概念上不需要任何参数。
  为了处理这种情况，OCaml提供了一个特殊的类型，称为 unit 类型。unit 类型只有一个值，写作 ()。 *)
let print_hello () = print_endline "Hello, World!";;

(* 在OCaml中，当调用一个接受 unit 类型参数的函数时，你必须显式地传递 () 作为参数。这是因为 unit 类型表示“无实际值”，但仍然需要满足函数签名的要求。 *)
print_hello () ;;
