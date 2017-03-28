defmodule StackServer do
  @moduledoc """
  Simple stack implemented with a genserver.

  ## Examples:

      iex> {:ok, pid} = StackServer.start_link
      iex> StackServer.push pid, 1
      iex> StackServer.pop pid
      1
  """

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

  @doc """
  Used to format the output of `:sys.get_status pid`
  """
  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "The current value of the stack is'#{inspect state}'."}]]
  end

end
