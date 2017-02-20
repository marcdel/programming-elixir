defmodule StringsAndBinaries1Test do
  use ExUnit.Case

  test "printable returns true when string contains printable characters" do
    result = StringExtensions.printable? 'hello'
    assert result == true
  end

  test "printable returns false when string contains non-printable characters" do
    result = StringExtensions.printable? 'hello' ++ [0]
    assert result == false
  end
end
