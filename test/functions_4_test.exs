defmodule Functions4Test do
  use ExUnit.Case

  test "mrs prefix" do
    prefix = fn pre ->
      fn post ->
        "#{pre} #{post}"
      end
    end

    mrs = prefix.("Mrs")
    assert mrs.("Smith") == "Mrs Smith"
  end

end
