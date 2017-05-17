defmodule StackServer do
  @moduledoc """
  Simple stack implemented with a genserver.
  """

  use GenServer

  def start_link stash_pid do
    GenServer.start_link __MODULE__, stash_pid, name: __MODULE__
  end

  def clear do
    GenServer.cast __MODULE__, :clear
  end

  def push(item) do
    GenServer.cast __MODULE__, {:push, item}
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def get do
    GenServer.call __MODULE__, :get
  end

  def init(stash_pid) do
    stack = StackServer.Stash.get_value stash_pid
    {:ok, {stack, stash_pid}}
  end

  def handle_cast(:clear, _state) do
    {:noreply, []}
  end

  def handle_cast({:push, item}, {stack, stash_pid}) do
    {:noreply, {[item | stack], stash_pid}}
  end

  def handle_cast(request, state) do
    super(request, state)
  end

  def handle_call(:pop, _from, {[head | tail], stash_pid}) do
    {:reply, head, {tail, stash_pid}}
  end

  def handle_call(:get, _from, {stack, stash_pid}) do
    {:reply, stack, {stack, stash_pid}}
  end

  def handle_call(request, from, state) do
    super(request, from, state)
  end

  def terminate(reason, {stack, stash_pid}) do
    StackServer.Stash.save_value stash_pid, stack
    IO.puts "Terminating for reason: #{reason}, with state: #{inspect stack}"
  end

  @doc """
  Used to format the output of `:sys.get_status pid`
  """
  def format_status(_reason, [_pdict, {stack, _stash_pid}]) do
    [data: [{'State', "The current value of the stack is'#{inspect stack}'."}]]
  end

end
