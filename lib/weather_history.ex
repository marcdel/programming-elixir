defmodule WeatherHistory do
  def for_location([], _location), do: []
  def for_location([head = [_, location, _, _] | tail], location) do
    [head | for_location(tail, location)]
  end
  def for_location([_head | tail], location), do: for_location(tail, location)
end
