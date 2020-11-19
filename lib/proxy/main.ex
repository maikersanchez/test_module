{:ok, balance} = Balance1.create(1000)

Balance1.deposit(balance, 100) |> IO.inspect()
Balance1.withdraw(balance, 30) |> IO.inspect()

IO.puts("-------------------------")

{:ok, balance} = GsBalance.create(1000)

GsBalance.deposit(balance, 100) |> IO.inspect()
GsBalance.withdraw(balance, 30) |> IO.inspect()
