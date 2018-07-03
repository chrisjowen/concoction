defmodule Concoction.Repo.Migrations.CreateTestTable do
  use Ecto.Migration

  def change do
    create table(:tests) do
      add :text_field, :string
    end
  end
end
