ExUnit.start

defmodule PatternMatchingTest do
  use ExUnit.Case
  
  test "a = [1,2,3]" do
    a = [1,2,3]
    assert a == [1,2,3]
  end
end
