defmodule ParallelTest do
  use ExUnit.Case

  test "pmap returns mapped elements in correct order" do
    result = Parallel.pmap 1..5, &(&1 * 2)
    assert result == [2, 4, 6, 8, 10]
  end
end
