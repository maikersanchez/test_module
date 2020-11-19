defmodule Main do
  IO.puts("-------------------------")
  subject = FObs.create()

  IO.puts(FObs.read(subject))

  FObs.attach(subject)

  FObs.increment(subject)
  IO.puts(FObs.await())

  FObs.increment(subject)
  IO.puts(FObs.await())

  FObs.decrement(subject)
  IO.puts(FObs.await())

  FObs.increment(subject)
  IO.puts(FObs.await())

end
