defmodule Concoction.IngredientSchema do
    use Ecto.Schema

    schema "ingredients" do
        field :name, :string
        field :description, :string
        field :thumb, :string
        timestamps()
    end
end