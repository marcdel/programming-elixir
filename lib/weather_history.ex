defmodule WeatherHistory do
  def for_location([], location), do: []
  def for_location([head = [_, location, _, _] | tail], location) do
    [head | for_location(tail, location)]
  end
  def for_location([head | tail], location), do: for_location(tail, location)
end
