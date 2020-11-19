IO.puts("SECTION 1 --------------------")

try do
  :bar/2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  ArithmeticError -> IO.puts("The disicions was not possible")
end


IO.puts("SECTION 2 --------------------")

try do
  :bar/2
rescue
  RuntimeError -> IO.puts("There was a runtime error")
  e in ArithmeticError -> IO.puts("The disicions was not possible: #{e.message}")
end

IO.puts("SECTION 3 --------------------")

try do
  raise CustomError, message: "My custom error"
rescue
  e in CustomError -> IO.puts("message: #{e.message}, country:#{e.country}")
end

try do
  raise CustomError, message: "My custom error", country: "Argentina"
rescue
  e in CustomError -> IO.puts("message: #{e.message}, country:#{e.country}")
end


IO.puts("Section 4: ---------------------")
try do
  IO.puts("this is not an error")
rescue
 e -> IO.puts("This is never printed")
after
  IO.puts("This is a always printed")
end

try do
  raise "There was an error :'("
rescue
 e -> IO.puts("This is never printed")
after
  IO.puts("This is a always printed")
end

IO.puts("Section 5: ---------------------")
try do
  IO.puts("this is not an error")
rescue
  e -> IO.puts("This is never printed #{e}")
after
  IO.puts("This is a always printed?")
end

# try do
#   raise "There was an error :'("
# rescue
#  e -> IO.puts("This is never printed #{e}")
# after
#   IO.puts("This is a always printed?")
# end

try do
  throw(453_637)
catch
 e -> IO.puts("This is a catch #{e}")
after
  IO.puts("This is a always printed?")
end

IO.puts("Section 6: ---------------------")
try do
  raise "hola"
  IO.puts("This is never printed")
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is a always printed?")
end

try do
  throw("hola")
  IO.puts("This is never printed")
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is a always printed?")
end

IO.puts("Section 7: ---------------------")
try do
  throw(nil)
  IO.puts("This is never printed")
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is a always printed?")
end

IO.puts("Section 8: ---------------------")
try do
  0..20
  |> Enum.each(fn x -> if x == 20, do: raise("Oops! x == 10") end)
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is a always printed?")
end

try do
  0..20
  |> Enum.each(fn x -> if x == 20, do: throw("Oops!") end)
rescue
  e -> IO.puts("From rescue: #{e.message}")
catch
  e -> IO.puts("From catch: #{e}")
after
  IO.puts("This is a always printed?")
end
