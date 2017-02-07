defmodule Functions3Test do
  use ExUnit.Case

  test "buzz_fizz" do
    fizz_buzz = fn
      [0,0,_] -> "FizzBuzz"
      [0,_,_] -> "Fizz"
      [_,0,_] -> "Buzz"
      [_,_,n] -> n
    end

    buzz_fizz = fn (n) ->
      fizz_buzz.([rem(n,3), rem(n,5), n])
    end

    assert buzz_fizz.(10) == "Buzz"
    assert buzz_fizz.(11) == 11
    assert buzz_fizz.(12) == "Fizz"
    assert buzz_fizz.(13) == 13
    assert buzz_fizz.(14) == 14
    assert buzz_fizz.(15) == "FizzBuzz"
    assert buzz_fizz.(16) == 16
  end

end
