defmodule CountdownTest do
  use ExUnit.Case

  @tag :skip
  test "counts down" do
    Countdown.timer
      |> Stream.each(&IO.puts/1)
      |> Stream.each(&Countdown.say/1)
      |> Enum.take(5)
  end
end
