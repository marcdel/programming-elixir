defmodule ListExtensions do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max([max]), do: max
  def max([head | tail]), do: Kernel.max(head, max(tail))

  def ceasar([], n), do: []
  def ceasar([head | tail], n) when head + n <= ?z, do: [head + n | ceasar(tail, n)]
  def ceasar([head | tail], n), do: [head + n - 26 | ceasar(tail, n)]

  def span(from, to), do: Enum.to_list from..to
  def recursive_span(from, to) when from > to, do: []
  def recursive_span(from, to), do: [from | recursive_span(from+1, to)]
end
