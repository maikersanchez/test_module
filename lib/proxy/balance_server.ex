defmodule BalanceServer do
  # def start(initial_abalance) do
  #   user_account = %UserAccount {
  #     userid: 001,
  #     account: 231,
  #     balance: initial_abalance
  #   }
  #   initial_state = %{:accounts => [user_account]}
  #   spawn(__MODULE__, (fn -> loop(initial_state) end))
  # end

  # def loop(current) do
  #   new_state = operation(current)
  #   loop(new_state)
  # end

  # def operation(current) do
  #   receive do
  #     message -> process(current, message)
  #   end
  # end

end
