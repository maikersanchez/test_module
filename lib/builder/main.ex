import UserBuilder

userbuild = create()
|> name("Milker", "Sánchez")
|> country("Colombia")
|> lenguajes(["español", "ingles", "serbian"])
|> programing_lenguajes([".net", "java", "angular", "elixir"])

IO.puts(inspect(userbuild))
