defmodule CustomError do
  defexception [:message, country: "Colombia"]
end

defmodule DefaultError do
defexception message: "My default Error"
end
