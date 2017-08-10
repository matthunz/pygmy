defmodule PygmyTest do
  use ExUnit.Case
  use Plug.Test
  import Ecto.Query

  alias Pygmy.Repo

  test "incorrect page returns 404" do
    conn = conn(:get, "/fake/page", "") |> Pygmy.call(%{})
    assert conn.status == 404
  end

  test "create link model and delete it" do
    link = %Link{short_url: "test", long_url: ""}
    temp = Repo.insert!(link)
    assert temp.short_url == "test"
    Repo.delete!(temp)
  end
end
