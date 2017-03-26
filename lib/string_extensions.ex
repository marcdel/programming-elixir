defmodule StringExtensions do
  def printable?(char_list), do: Enum.all? char_list, &(&1 >= 32 && &1 <= 126)
  def anagram?(word1, word2) do
    word1 = prepare_word(word1)
    word2 = prepare_word(word2)

    (word1 -- word2) |> Enum.count == 0
  end
  def prepare_word(word) do
    word
    |> String.downcase()
    |> String.replace(" ", "")
    |> String.graphemes()
  end
end
