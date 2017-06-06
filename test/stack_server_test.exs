defmodule StackServerTest do
  @moduledoc """
  """
  use ExUnit.Case

  setup do
    StackServer.clear
  end

  test "stack is initially empty" do
    assert StackServer.get == []
  end

  test "push adds item to the stack" do
    StackServer.push 1
    assert StackServer.get == [1]
  end

  test "push adds item to the front stack" do
    StackServer.push 1
    StackServer.push 2
    assert StackServer.get == [2,1]
  end

  test "pop removes the first item from the stack" do
    StackServer.push 1
    StackServer.push 2
    item = StackServer.pop
    assert item == 2
  end

  test "clear removes all items from the stack" do
    StackServer.push 1
    StackServer.push 2
    StackServer.clear
    assert StackServer.get == []
  end

  test "respawns after it is killed" do
    pid = :erlang.whereis(StackServer)
    :erlang.exit(pid, "Killed by test")
    :timer.sleep(1) # Give supervisor time to restart
    new_pid = :erlang.whereis(StackServer)
    assert pid != new_pid
  end
end
