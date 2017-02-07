defmodule Functions5Test do
  use ExUnit.Case
  require Integer

  test "inline map" do
    new_list = Enum.map [1,2,3,4], &(&1 + 2)
    assert new_list == [3, 4, 5, 6]
  end

  test "inline each" do
    result = Enum.each [1,2,3,4], &Integer.is_even/1 
    assert result == :ok
  end
end
