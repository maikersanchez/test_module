defmodule While do
  # for(n)
  # {
  #     int = 0
  #     whilw(i<n){
  #         print(value)
  #         i++;
  #     }
  # }
  def for_loop(i, n, value) do
    cond do
      i < n ->
        IO.puts("#{value} #{i}")
        for_loop(i + 1, n, value)

      true ->
        :ok
    end
  end

  # while(true)
  # {
  #     print(value)
  #     if(!cond){
  #         break
  #     }
  # }
  def do_while(n, value) do
    cond do
      n > 0 ->
        IO.puts("#{value} #{n}")
        do_while(n - 1, value)

      true ->
        :ok
    end
  end
end

While.do_while(0, "Prueba")
