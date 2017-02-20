defmodule StringsAndBinaries2Test do
  use ExUnit.Case

  test "anagram? returns true if parameters are anagrams" do
    result = StringExtensions.anagram? "Eleven plus two", "Twelve plus one"
    assert result == true
  end
end
