defmodule MCVE.Repo do
  use Ecto.Repo,
    otp_app: :mcve,
    adapter: Ecto.Adapters.Postgres
end
