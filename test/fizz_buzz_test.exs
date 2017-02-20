defmodule FizzBuzzTest do
  use ExUnit.Case

  test "up_to returns fizzbuzz values up to n" do
    result = FizzBuzz.up_to 15
    assert result == [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"]
  end
end
