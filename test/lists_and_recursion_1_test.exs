defmodule ListsAndRecursion1Test do
  use ExUnit.Case

  test "mapsum applies function and them sums result" do
    result = ListExtensions.mapsum [1, 2, 3], &(&1 * &1)
    assert result == 14
  end
end
