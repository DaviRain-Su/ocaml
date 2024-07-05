open OUnit2
open Real_ocaml_world

let make_square_test name expected_output input =
  name >:: (fun _ -> assert_equal expected_output (square input))

let tests = "test suite for square" >::: [
  make_square_test "test_one" 1 1;
  make_square_test "test_two" 4 2;
  make_square_test "test_three" 9 3;
  make_square_test "test_four" 16 4;
]

let _ = run_test_tt_main tests