defmodule MCVE do
  import Ecto.Query

  alias MCVE.{App, Tag, AppTag}

  def list_apps_by_flop(flop) do
    apps_query =
      from(a in App,
        left_join: at in assoc(a, :tags),
        as: :tags,
        on: a.id == at.app_id,
        left_join: t in assoc(at, :tag),
        as: :tag,
        on: t.id == at.tag_id,
        preload: [tags: {at, tag: t}]
      )

    Flop.validate_and_run(
      apps_query,
      flop,
      for: App
    )
  end
end
