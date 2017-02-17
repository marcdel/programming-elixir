defmodule ListsAndRecursion6Test do
  use ExUnit.Case

  test "returns a flat list" do
    result = ListExtensions.flatten [1, [2], [[3]]]
    assert result == [1,2,3]
  end
end
