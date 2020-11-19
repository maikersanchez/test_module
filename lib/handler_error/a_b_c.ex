defmodule B do
  def create do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      {:ok, from_pid, millis} ->
        Process.sleep(millis)
        send(from_pid, :ok)
        loop()

      {:error, from_pid, millis} ->
        Process.sleep(millis)
        raise CustomError, message: "Error desde B"
        send(from_pid, :error)
        loop()
    end
  end
end

b = B.create()
IO.puts("Section 1: ---------------------")
send(b, {:ok, self(), 1000})
IO.puts("b << :ok, 1000")

receive do
  :ok -> IO.puts("B respond in one second")
end

b = B.create()
IO.puts("Section 2: ---------------------")
send(b, {:ok, self(), 2000})
IO.puts("b << :ok, 2000")

receive do
  :ok -> IO.puts("B respond in two second")
after
  1000 -> IO.puts("Timeout 1000ms")
end

IO.puts("Section 3: ---------------------")
send(b, {:error, self(), 4000})
# IO.puts("b << :ok, 1000")
receive do
  {:error, message} -> IO.puts("B respond in error: #{message}")
after
  2000 -> IO.puts("Timeout 2000ms")
end
