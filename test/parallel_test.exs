defmodule ParallelTest do
  use ExUnit.Case
  import :timer, only: [ sleep: 1 ]

  # With 50 elements doing a long running taskrando_pmap should always
  # return at least one element out of order, but pmap should always be correct.
  @list 1..50

  def slow_work element do
    sleep 10
    element * 2
  end

  test "pmap returns mapped elements in correct order" do
    expected_result = Enum.map @list, &(slow_work(&1))
    result = Parallel.pmap @list, &(slow_work(&1))

    assert result == expected_result
  end

  test "rando_pmap returns mapped elements in any order" do
    expected_result = Enum.map @list, &(slow_work(&1))
    result = Parallel.rando_pmap @list, &(slow_work(&1))

    assert result != expected_result
  end
end
