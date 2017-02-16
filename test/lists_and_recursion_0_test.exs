defmodule ListsAndRecursion0Test do
  use ExUnit.Case

  test "sum without accumulator" do
    result = ListExtensions.sum([1,2,3,4])
    assert result == 10
  end
end
