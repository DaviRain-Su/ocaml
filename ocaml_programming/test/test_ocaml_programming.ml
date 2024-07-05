open OUnit2
open Ocaml_programming

let make_sum_test name expected_output input =
  name >:: (fun _ -> assert_equal expected_output (sum input) ~printer:string_of_int)

let make_length_test name expected_output input =
  name >:: (fun _ -> assert_equal expected_output (length input) ~printer:string_of_int)

let make_empty_test name expected_output input =
  name >:: (fun _ -> assert_equal expected_output (empty input) ~printer:string_of_bool)

let tests = "test suite for sum" >::: [
  make_sum_test "empty" 0 [];
  make_sum_test "singleton" 1 [1];
  make_sum_test "two_elements" 3 [1; 2];
]

let _ = run_test_tt_main tests

let test = "test suite for length" >::: [
  make_length_test "empty" 0 [];
  make_length_test "singleton" 1 [1];
  make_length_test "two_elements" 2 [1; 2];
]

let _ = run_test_tt_main test

let test = "test suite for empty" >::: [
  make_empty_test "empty" true [];
  make_empty_test "singleton" false [1];
  make_empty_test "two_elements" false [1; 2];
]

let _ = run_test_tt_main test

let make_next_weekday_test name expected_output input =
  name >:: (fun _ -> assert_equal expected_output (next_weekday input))

let tests = "test suite for next_weekday" >::: [
  make_next_weekday_test "tue_after_mon" Tuesday Monday;
  make_next_weekday_test "wed_after_tue" Wednesday Tuesday;
  make_next_weekday_test "thu_after_wed" Thursday Wednesday;
  make_next_weekday_test "fri_after_thu" Friday Thursday;
  make_next_weekday_test "mon_after_fri" Monday Friday;
  make_next_weekday_test "mon_after_sat" Monday Saturday;
  make_next_weekday_test "mon_after_sun" Monday Sunday;
]

let _ = run_test_tt_main tests
