defmodule MCVETest do
  use ExUnit.Case
  use MCVE.RepoCase

  test "not using filtering returns" do
    create_application()

    app = MCVE.Repo.one(MCVE.App) |>  Repo.preload([tags: :tag])
    assert app.tags |> Enum.map(& &1.tag.title) |> Enum.sort() == ["hello", "how_r_u"]
  end


  test "total count is total of app entities" do
    create_application()

    {:ok, {apps, meta}} = MCVE.list_apps_by_flop(%{})
    assert length(apps) == 1
    assert meta.total_count == 1
  end

  test "many-to-many holds all relations" do
    create_application()

    {:ok, {[app | _], meta}} =
      MCVE.list_apps_by_flop(%Flop{
        filters: [
          %Flop.Filter{
            field: :app_tags,
            op: :==,
            value: "hello"
          }
        ]
      })

    assert app.tags |> Enum.map(& &1.tag.title) |> Enum.sort() == ["hello", "how_r_u"]
  end

  defp create_application() do
    Repo.insert(%MCVE.App{
      tags: [
        %MCVE.AppTag{tag: %MCVE.Tag{title: "hello"}},
        %MCVE.AppTag{tag: %MCVE.Tag{title: "how_r_u"}}
      ],
      title: "test-app"
    })
  end
end
