import Config

config :mcve, MCVE.Repo,
  database: "mcve_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :mcve,
  ecto_repos: [MCVE.Repo]

config :flop, repo: MCVE.Repo

import_config "#{Mix.env()}.exs"
