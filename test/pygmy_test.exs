defmodule PygmyTest do
  use ExUnit.Case

  use Plug.Test

  test "incorrect page returns 404" do
    conn = conn(:get, "/fake/page", "") |> Pygmy.call(%{})
    assert conn.status == 404
  end
end
