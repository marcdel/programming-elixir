prefix = fn pre ->
  fn post ->
    "#{pre} #{post}"
  end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
