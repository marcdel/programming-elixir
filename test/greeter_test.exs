defmodule GreeterTest do
  use ExUnit.Case

  test "marc greeter" do
    marc_greeter = Greeter.for "Marc", "Hello,"
    assert marc_greeter.("Marc") == "Hello, Marc"
    assert marc_greeter.("Mark") == "I don't know you"
  end

end
