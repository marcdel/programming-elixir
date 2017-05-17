defmodule StackSupervisor do
  use Supervisor
  def start_link(initial_value) do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [initial_value])
    start_workers(sup, initial_value)
    result
  end

  def start_workers(sup, initial_value) do
    {:ok, stash_pid} =
       Supervisor.start_child(sup, worker(StackServer.Stash, [initial_value]))

    Supervisor.start_child(sup, supervisor(StackServer, [stash_pid]))
  end

  def init(_) do
    supervise [], strategy: :one_for_one
  end
end
