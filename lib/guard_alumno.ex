defmodule GuardAlumno do

  # - is_integer
  #   is_boolean
  #   ...
  #   guards
  #   String : "Bienvenido Nombre"
  #   int    : "Tu nota es x"
  #   boolean : Paso/No Paso
  #   funciones anonimas / nombradas , hof


  def alumno(x)  when is_boolean(x) do
    if x == true do
      "Paso"
    else

      "No paso"
    end
  end
  def alumno(x)  when is_bitstring(x) do
    "Bienvenido " <> x

  end
  def alumno(x)  when is_integer(x) do
    "Tu nota es " <> x

  end
end
