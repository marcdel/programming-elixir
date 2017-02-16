defmodule WeatherHistory do
  def for_location([], location), do: []
  def for_location([[time, location, temp, rain] | tail], location) do
    [[time, location, temp, rain] | for_location(tail, location)]
  end
  def for_location([head | tail], location), do: for_location(tail, location)
end
