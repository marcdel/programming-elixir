defmodule ListsAndRecursion4Test do
  use ExUnit.Case

  test "span returns a list of numbers" do
    a_span = ListExtensions.span 1, 10
    assert a_span == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  test "recursive_span returns a list of numbers" do
    a_span = ListExtensions.recursive_span 1, 10
    assert a_span == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end
end
