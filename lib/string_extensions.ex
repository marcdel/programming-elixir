defmodule StringExtensions do
  def printable?(char_list), do: Enum.all? char_list, &(&1 >= 32 && &1 <= 126)
  def anagram?(word1, word2) do
    word1 = word1 |> String.downcase() |> String.replace(" ", "") |> String.graphemes()
    word2 = word2 |> String.downcase() |> String.replace(" ", "") |> String.graphemes()

    (word1 -- word2) |> Enum.count == 0
  end
end
