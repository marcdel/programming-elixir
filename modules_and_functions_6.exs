defmodule Chop do
  def guess(actual, first..last) do
    _guess(div(last, 2), actual, first..last)
  end
  defp _guess(guess, actual, first..last) when (guess < first) do
    IO.puts "#{guess} < #{first}"
  end
  defp _guess(guess, actual, first..last) when (guess > last) do
    IO.puts "#{guess} > #{last}"
  end
  defp _guess(guess, actual, range) when (guess == actual) do
    actual
  end
  defp _guess(guess, actual, first..last) when (guess > actual) do
    IO.inspect {guess, actual, first, last}
    _guess(div(last - (guess + 1), last), actual, first..last)
  end
  defp _guess(guess, actual, first..last) when (guess < actual) do
    IO.inspect {guess, actual, first, last}
    _guess(div((guess - 1) - first, first), actual, first..last)
  end
end
