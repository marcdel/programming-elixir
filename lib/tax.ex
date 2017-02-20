defmodule Tax do
  def insert_totals(orders, tax_rates) do
    orders
    |> Enum.map(&(add_total(&1, tax_rates)))
  end

  defp add_total(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    tax = net * tax_rate
    total = net + tax
    Keyword.put(order, :total_amount, total)
  end
end
