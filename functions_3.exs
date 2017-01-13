fizz_buzz = fn
  [0,0,_] -> "FizzBuzz"
  [0,_,_] -> "Fizz"
  [_,0,_] -> "Buzz"
  [_,_,n] -> n
end

buzz_fizz = fn (n) ->
  fizz_buzz.([rem(n,3), rem(n,5), n])
end

IO.puts buzz_fizz.(10)
IO.puts buzz_fizz.(11)
IO.puts buzz_fizz.(12)
IO.puts buzz_fizz.(13)
IO.puts buzz_fizz.(14)
IO.puts buzz_fizz.(15)
IO.puts buzz_fizz.(16)
