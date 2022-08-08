defmodule MCVE.Tag do
  use Ecto.Schema

  schema "tags" do
    field(:title, :string)

    many_to_many(:apps, MCVE.App,
      join_through: MCVE.AppTag,
      unique: true,
      on_replace: :delete
    )
  end
end
