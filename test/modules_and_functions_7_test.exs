defmodule ModulesAndFunctions7Test do
  use ExUnit.Case

  test "float to string with two decimal places" do
    a_float = 2.0/3.0
    # :io.format prints to console,
    # :io_lib.format returns a list of the result and a newline.
    [result | _newline_char] = :io_lib.format("~.2f~n", [a_float])
    assert result == '0.67'
  end

  test "get environment variable" do
    path = System.get_env("PATH")
    assert String.contains?(path, "/usr/local") == true
  end

  test "get file extension" do
    extension = Path.extname "somewhere/test.exs"
    assert extension == ".exs"
  end

  test "get current working directory of process" do
    cwd = System.cwd
    assert String.contains?(cwd, "programming-elixir") == true
  end

  test "execute command in operating system shell" do
    {pwd, _} = System.cmd "pwd", []
    assert String.contains?(pwd, "programming-elixir") == true
  end
end
