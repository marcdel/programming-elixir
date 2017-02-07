defmodule Functions2Test do
  use ExUnit.Case

  test "fizzbuzz" do
    fizz_buzz = fn
      0, 0, _ -> "FizzBuzz"
      0, _, _ -> "Fizz"
      _, 0, _ -> "Buzz"
      _, _, n -> n
    end
    
    assert fizz_buzz.(0,0,1) == "FizzBuzz"
    assert fizz_buzz.(0,1,1) == "Fizz"
    assert fizz_buzz.(1,0,1) == "Buzz"
    assert fizz_buzz.(1,1,1) == 1
  end

end
