defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self(), fn (_,send_to) ->
      # Each time we spawn a new process,
      # we pass it the previous process’s PID in the send_to parameter.
      spawn(Chain, :counter, [send_to])  # returns pid to next iteration
    end

    send last, 0     # start the count by sending a zero to the last process

    receive do       # and wait for the result to come back to us
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end
