defmodule Functions31Test do
  use ExUnit.Case

  test "nested function addition" do
    add_x = fn x ->
      fn y ->
        x + y
      end
    end

    add_two = add_x.(2)
    result = 3 |> add_two.()

    assert result == 5
  end

end
