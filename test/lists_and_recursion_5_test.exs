defmodule ListsAndRecursion5Test do
  use ExUnit.Case

  test "all? returns true when all elements match" do
    result = ListExtensions.all? [1,2,3,4], &(&1 < 5)
    assert result == true
  end

  test "all? returns false when not all elements match" do
    result = ListExtensions.all? [1,2,3,4], &(&1 < 2)
    assert result == false
  end

  test "each applies function to each element" do
    result = ListExtensions.each [1,2,3,4], &(&1 + 1)
    assert result == [2,3,4,5]
  end

  test "filter returns elements that pass the filter" do
    require Integer
    result = ListExtensions.filter [1,2,3,4], &(Integer.is_even(&1))
    assert result == [2,4]
  end

  test "split returns two lists at the selected position" do
    result = ListExtensions.split [5,4,3,2,1], 2
    assert result == [[5,4], [3,2,1]]
  end

  test "returns the first n elements" do
    result = ListExtensions.take [5,4,3,2,1], 3
    assert result == [5,4,3]
  end
end
