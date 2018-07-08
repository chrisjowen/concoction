defmodule Concoction.Repo.Migrations.CreateCoreTables do
  use Ecto.Migration

  def change do
    create table(:endpoints) do
      add :name, :string
      add :description, :string
      add :method, :string
      add :url_template, :string
      add :body_template, :string
      add :headers, :map
      add :auth_type, :string
      timestamps()
    end

    create table(:connections) do
      add :auth_type, :string
      add :credentials, :map
      add :options, :map
      timestamps()
    end

    create table(:polls) do
      add :schedule, :string
      add :params, :map
      add :active, :boolean, default: false
      add :connection_id, references(:connections), null: false
      add :endpoint_id, references(:endpoints), null: false
      timestamps()
    end

  end 
  
end

