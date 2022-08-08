defmodule MCVE.AppTag do
  use Ecto.Schema

  schema "app_tags" do
    field(:tag_id, :id, primary_key: true)
    field(:app_id, :id, primary_key: true)

    belongs_to(:tag, MCVE.Tag, define_field: false)
    belongs_to(:app, MCVE.App, define_field: false)
  end
end
