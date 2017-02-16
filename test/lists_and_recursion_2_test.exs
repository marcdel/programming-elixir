defmodule ListsAndRecursion2Test do
  use ExUnit.Case

  test "max returns the largest element in the list" do
    max_value = ListExtensions.max [1, 5, 3, 2, 4]
    assert max_value == 5
  end
end
