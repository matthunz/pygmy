defmodule Pygmy.UrlGen do
  import Ecto.Query

  @chars "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" |> String.split("")
  defp random_string do
    Enum.reduce((1..6), [], fn (_i, acc) ->
      [Enum.random(@chars) | acc]
    end) |> Enum.join("")
  end

  def new do
    short_url = random_string()
    query = from l in "links",
      where: l.short_url == ^short_url,
      select: l.short_url

    case Pygmy.Repo.one(query) do
      nil ->
        short_url
      _ ->
        new()
    end
  end

end
