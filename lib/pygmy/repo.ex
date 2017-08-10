defmodule Pygmy.Repo do
  use Ecto.Repo,
    otp_app: :pygmy,
    adapter: Sqlite.Ecto
end
