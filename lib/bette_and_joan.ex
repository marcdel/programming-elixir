defmodule BetteAndJoan do
  def do_work do
    receive do
      name ->
        IO.inspect {:ok, name}
    end
  end

  def run do
    for _ <- 1..10 do
      name = Enum.random([:bette, :joan])
      create_process(name)
    end
  end

  def create_process :bette do
    IO.puts "Spawning #{:bette}"
    bette = spawn(BetteAndJoan, :do_work, [])
    send bette, :bette
  end

  def create_process :joan do
    IO.puts "Spawning #{:joan}"
    joan = spawn(BetteAndJoan, :do_work, [])
    send joan, :joan
  end
end
