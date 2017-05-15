defmodule StackServer do
  @moduledoc """
  Simple stack implemented with a genserver.
  """

  use GenServer

  def start_link do
    StackServer.start_link []
  end

  def start_link stack do
    GenServer.start_link __MODULE__, stack, name: __MODULE__
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

  def handle_cast(:clear, state) do
    {:noreply, []}
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

  def terminate(reason, state) do
    IO.puts "Terminating for reason: #{reason}, with state: #{inspect state}"
    :shutdown
  end

  @doc """
  Used to format the output of `:sys.get_status pid`
  """
  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "The current value of the stack is'#{inspect state}'."}]]
  end

end
