defmodule Concoction.Factory do
    use ExMachina.Ecto, repo: Concoction.Repo
    alias Concoction.{IngredientSchema}

    def ingredient_factory do
      %IngredientSchema{
        name: "Ingredient name",
        description: "Ingredient description",
        thumb: "Hello"
      }
    end


end