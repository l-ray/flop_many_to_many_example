defmodule MCVE.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias MCVE.Repo

      import Ecto
      import Ecto.Query
      import MCVE.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(MCVE.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(MCVE.Repo, {:shared, self()})
    end

    :ok
  end
end
