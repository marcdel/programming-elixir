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

  def all?([], _func), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  def each([], _func), do: []
  def each([head | tail], func), do: [func.(head) | each(tail, func)]

  def filter([], _func), do: []
  def filter([head | tail], func) do
    if(func.(head)) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(list, count), do: split(list, [], count)
  defp split([], front, _), do: [ Enum.reverse(front), [] ]
  defp split(tail, front, 0), do: [ Enum.reverse(front), tail ]
  defp split([ head | tail ], front, count)  do
    split(tail, [head|front], count-1)
  end

  def take(list, n), do: hd(split(list, n))

  def flatten([]), do: []
  def flatten([ head | tail ]), do: flatten(head) ++ flatten(tail)
  def flatten(head), do: [ head ]

  def primes_to(n) do
    range = span(2, n)
    range -- (for a <- range, b <- range, a <= b, a * b <= n, do: a * b)
  end
end
