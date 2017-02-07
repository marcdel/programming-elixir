defmodule ModulesAndFunctions6Test do
  use ExUnit.Case

  test "guess" do
    result = Chop.guess 666, 1..1000
    assert result == 666
  end
end
