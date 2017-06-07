defmodule TimesMacro do
  @moduledoc """
  Creates a times_n function, where n is the number passed in.

  Examples:

    TimesMacro.times_n(3)
    Test.times_3(4) == 12

    TimesMacro.times_n(4)
    Test.times_4(5) == 20

  """

  defmacro times_n(number) do
    quote do
      def unquote(:"times_#{number}")(x) do
        unquote(number) * x
      end
    end
  end

end
