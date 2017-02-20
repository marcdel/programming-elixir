defmodule ListsAndRecursion7Test do
  use ExUnit.Case

  test "primes_to calculates primes from 2 to n" do
    result = ListExtensions.primes_to 10
    assert result == [2, 3, 5, 7]
  end
end
