defmodule MyMacroTest do
  @moduledoc """
  """
  use ExUnit.Case
  require MyMacro

  describe "if" do
    test "evaluates first clause if true" do
      a = 1
      b = 1
      MyMacro.if a == b do
        assert true
      else
        assert false
      end
    end

    test "evaluates second clause if false" do
      a = 1
      b = 2
      MyMacro.if a == b do
        assert false
      else
        assert true
      end
    end
  end

  describe "unless" do
    test "evaluates first clause if false" do
      a = 1
      b = 1
      MyMacro.unless a == b do
        assert false
      else
        assert true
      end
    end

    test "evaluates second clause if true" do
      a = 1
      b = 2
      MyMacro.unless a == b do
        assert true
      else
        assert false
      end
    end
  end
end
