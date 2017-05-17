defmodule StackServer.Application do
  use Application

  def start(_type, _args) do
    {:ok, _pid} = StackSupervisor.start_link([])
  end
end
