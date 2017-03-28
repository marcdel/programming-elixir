defmodule StackServerTest do
  use ExUnit.Case

  test "stack is initially empty" do
    StackServer.start_link

    assert StackServer.get == []
  end

  test "push adds item to the stack" do
    StackServer.start_link

    StackServer.push 1

    assert StackServer.get == [1]
  end

  test "push adds item to the front stack" do
    StackServer.start_link

    StackServer.push 1
    StackServer.push 2

    assert StackServer.get == [2,1]
  end

  test "pop removes the first item from the list" do
    StackServer.start_link

    StackServer.push 1
    StackServer.push 2
    item = StackServer.pop

    assert item == 2
  end
end
