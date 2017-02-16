defmodule ListsAndRecursion3Test do
  use ExUnit.Case

  test "ceasar cipher" do
    new_string = ListExtensions.ceasar 'ryvkve', 13
    assert new_string == 'elixir'
  end
end
