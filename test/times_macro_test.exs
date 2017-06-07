defmodule TimesMacroTest do
  @moduledoc """
  """
  use ExUnit.Case
  require TimesMacro
  TimesMacro.times_n(5)
  TimesMacro.times_n(3)

  describe "times_n" do
    test "times_n(5)" do
      assert TimesMacroTest.times_5(2) == 10
    end

    test "times_n(3)" do
      assert TimesMacroTest.times_3(4) == 12
    end
  end
end
