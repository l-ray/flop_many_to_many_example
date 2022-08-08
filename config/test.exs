use Mix.Config

config :mcve, MCVE.Repo,
  username: "postgres",
  password: "postgres",
  database: "mcve_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
