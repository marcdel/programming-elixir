defmodule StackServerTest do
  use ExUnit.Case

  test "stack is initially empty" do
    {:ok, pid} = StackServer.start_link

    assert StackServer.get(pid) == []
  end

  test "push adds item to the stack" do
    {:ok, pid} = StackServer.start_link

    StackServer.push(pid, 1)

    assert StackServer.get(pid) == [1]
  end

  test "push adds item to the front stack" do
    {:ok, pid} = StackServer.start_link

    StackServer.push(pid, 1)
    StackServer.push(pid, 2)

    assert StackServer.get(pid) == [2,1]
  end

  test "pop removes the first item from the list" do
    {:ok, pid} = StackServer.start_link

    StackServer.push(pid, 1)
    StackServer.push(pid, 2)
    item = StackServer.pop(pid)

    assert item == 2
  end
end
