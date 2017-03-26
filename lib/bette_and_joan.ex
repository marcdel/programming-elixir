defmodule BetteAndJoan do
  @moduledoc """
  BetteAndJoan.run creates processes with either :bette or :joan
  which then output the name received.

  elixir -r lib/bette_and_joan.ex -e "BetteAndJoan.run()"
  """

  def run do
    for _ <- 1..10 do
      name = Enum.random([:bette, :joan])
      create_process(name)
    end
  end

  def do_work do
    receive do
      name ->
        IO.inspect {:ok, name}
    end
  end

  defp create_process :bette do
    IO.puts "Spawning #{:bette}"
    bette = spawn(BetteAndJoan, :do_work, [])
    send bette, :bette
  end

  defp create_process :joan do
    IO.puts "Spawning #{:joan}"
    joan = spawn(BetteAndJoan, :do_work, [])
    send joan, :joan
  end
end
