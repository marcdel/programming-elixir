defmodule StackServer.Stash do
  @moduledoc """
  Manages the state of the stack server in the event that is crashes.
  """
  use GenServer

  # External API

  def start_link(initial_value) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, initial_value)
  end

  def save_value(pid, value) do
    GenServer.cast pid, {:save_value, value}
  end

  def get_value(pid) do
    GenServer.call pid, :get_value
  end

  # GenServer implementation

  def handle_call(:get_value, _from, current_value) do
    {:reply, current_value, current_value}
  end

  def handle_cast({:save_value, value}, _current_value) do
    {:noreply, value}
  end
end
