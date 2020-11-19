defmodule ExerciseHof do

    def sum(x) do
      fn(y) -> x+y end
    end
  
    def rest(x) do
      x-1
    end
  
    def mult(x) do
      x*2
    end
  
    def funcion_hof(x, funcx) do
      funcx.(x)
    end
  
  
  end
  