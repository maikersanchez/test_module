readfile = fn filename ->
  case File.read(filename) do
    {:ok, data} -> IO.puts(data)
    {:error, reason} -> IO.puts("Error because of #{reason}")
  end
end

readfile.("atom_errors.e")
IO.puts("-----------------------")
readfile.("atom_errors.ex")
