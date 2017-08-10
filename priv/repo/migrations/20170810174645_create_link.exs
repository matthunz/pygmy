defmodule Pygmy.Repo.Migrations.CreateLink do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :short_url, :string
      add :long_url, :string

      timestamps
    end
  end
end
