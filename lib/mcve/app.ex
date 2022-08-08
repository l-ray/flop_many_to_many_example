defmodule MCVE.App do
  use Ecto.Schema

  @derive {Flop.Schema,
           filterable: [:title, :app_tags],
           sortable: [:title],
           join_fields: [app_tags: [binding: :tag, field: :title]]}
  schema "apps" do
    field(:title, :string)
    has_many(:tags, MCVE.AppTag, on_replace: :delete)
  end
end
