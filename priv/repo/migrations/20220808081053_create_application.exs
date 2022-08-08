defmodule MCVE.Repo.Migrations.CreateApplication do
  use Ecto.Migration

  def change do

    create table(:tags) do
      add :title, :string, null: false
    end

    create table(:apps) do
     add :title, :string
    end

    create table(:app_tags) do
      add :tag_id,
          references(:tags, on_delete: :delete_all, type: :INT),
          primary_key: true
      add :app_id, references(:apps, on_delete: :delete_all, type: :INT),
        primary_key: true
    end

    create index(:app_tags, [:app_id])
    create index(:app_tags, [:tag_id])
    create unique_index(:app_tags, [:app_id, :tag_id])
  end
end
