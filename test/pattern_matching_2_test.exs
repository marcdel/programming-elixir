defmodule PatternMatching2Test do
  use ExUnit.Case

  test "[a,b,a] = [1,2,3]" do
    assert_raise MatchError, fn ->
      [a,b,a] = [1,2,3]
    end
  end

  test "[a,b,a] = [1,1,2]" do
    assert_raise MatchError, fn ->
      [a,b,a] = [1,1,2]
    end
  end

  test "[a,b,a] = [1,2,1]" do
      [a,b,a] = [1,2,1]
      assert a == 1
      assert b == 2
  end
end
