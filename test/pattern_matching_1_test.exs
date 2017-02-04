defmodule PatternMatching1Test do
  use ExUnit.Case
  
  test "a = [1,2,3]" do
    a = [1,2,3]
    assert a == [1,2,3]
  end

  test "a = 4" do
    a = 4
    assert a == 4
  end

  test "4 = a" do
    a = 4
    4 = a
    assert a == 4
  end

  test "[a,b] = [1,2,3]" do
    assert_raise MatchError, fn ->
      [a,b] = [1,2,3]
    end
  end

  test "a = [[1,2,3]]" do
    a = [[1,2,3]]
    assert a == [[1,2,3]]
  end

  test "[a] = [[1,2,3]]" do
    [a] = [[1,2,3]]
    assert a == [1,2,3]
  end

  test "[[a]] = [[1,2,3]]" do
    assert_raise MatchError, fn ->
      [[a]] = [[1,2,3]]
    end
  end
end
