defmodule Concoction.Repo.Migrations.CreateIngredientTable do
  use Ecto.Migration

  def change do
    create table(:ingredients) do
      add :name, :string
      add :description, :string
      add :thumb, :string
      timestamps()
    end
  end
end
