defmodule Concoction.Repo.Migrations.CreateActionTable do
  use Ecto.Migration

  def change do
    create table(:actions) do
      add :connection_id  , references(:connections), null: false
      add :endpoint_id    , references(:endpoints), null: false
      add :parent_id        , references(:actions), null: true
      timestamps()
    end
    alter table(:polls) do
      add :action_id        , references(:actions), null: false
      remove :connection_id
      remove :endpoint_id
    end
  end
end
