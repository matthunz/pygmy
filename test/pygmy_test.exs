defmodule PygmyTest do
  use ExUnit.Case
  doctest Pygmy

  test "greets the world" do
    assert Pygmy.hello() == :world
  end
end
