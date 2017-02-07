defmodule Chop do
  def guess(actual, range = low..high) do
    guess = div(low + high, 2)
    # IO.puts "Is it #{guess}?"

    do_guess(guess, actual, range)
  end

  defp do_guess(actual, actual, _range) do
    # IO.puts actual
    actual
  end

  defp do_guess(guess, actual, low..high) when (guess > actual) do
    guess(actual, low..guess-1)
  end

  defp do_guess(guess, actual, low..high) when (guess < actual) do
    guess(actual, guess+1..high)
  end
end
