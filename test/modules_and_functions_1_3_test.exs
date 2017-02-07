defmodule ModulesAndFunctions1Test do
  use ExUnit.Case

  test "double" do
    result = Times.double 2
    assert result == 4
  end

  test "triple" do
    result = Times.triple 2
    assert result == 6
  end

  test "quadruple" do
    result = Times.quadruple 2
    assert result == 16
  end
end
