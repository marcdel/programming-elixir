defmodule ModulesAndFunctions4Test do
  use ExUnit.Case

  test "sum" do
    result = Calculate.sum 5
    assert result == 15
  end

  test "gcd when y is 0 returns x" do
    result = Calculate.gcd 5, 0
    assert result == 5
  end

  test "gcd" do
    result = Calculate.gcd 7, 15
    assert result == 1
  end
end
