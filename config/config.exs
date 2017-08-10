use Mix.Config

config :pygmy, Pygmy.Repo,
  adapter: Sqlite.Ecto,
  database: "pygmy.sqlite3"
