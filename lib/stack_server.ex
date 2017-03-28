defmodule StackServer do
  use GenServer

  def start_link do
    GenServer.start_link __MODULE__, [], name: __MODULE__
  end

  def push(pid, item) do
    GenServer.cast pid, {:push, item}
  end

  def pop(pid) do
    GenServer.call pid, :pop
  end

  def get(pid) do
    GenServer.call pid, :get
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end

  def handle_cast(request, state) do
    super(request, state)
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_call(:get, _from, list) do
    {:reply, list, list}
  end

  def handle_call(request, from, state) do
    super(request, from, state)
  end
end
