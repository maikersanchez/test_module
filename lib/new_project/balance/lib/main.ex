# import Balance

# {:ok, balance} = Balance.create(1000)

# Balance.deposit(balance, 100) |> IO.inspect()
# Balance.withdraw(balance, 30) |> IO.inspect()

# {:ok, subject} = Obs.create()
# Obs.read(subject) |> IO.puts()
# Obs.attach(subject)
# Obs.read(subject) |> IO.puts()
# Obs.increment(subject)
# Obs.await() |> IO.puts()
# Obs.decrement(subject)
# Obs.await() |> IO.puts()
# Obs.detach(subject)
# Obs.increment(subject)
# Obs.await() |> IO.puts()
# IO.puts("The conunter is #{Obs.read(subject)}")
