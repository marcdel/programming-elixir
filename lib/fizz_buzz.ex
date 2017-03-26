defmodule FizzBuzz do
  def up_to(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n), do: do_fizzbuzz(n, rem(n, 3), rem(n, 5))

  defp do_fizzbuzz(_n, 0, 0), do: "FizzBuzz"
  defp do_fizzbuzz(_n, 0, _), do: "Fizz"
  defp do_fizzbuzz(_n, _, 0), do: "Buzz"
  defp do_fizzbuzz(n, _, _), do: n
end
