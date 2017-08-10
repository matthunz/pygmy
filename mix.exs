defmodule Pygmy.Mixfile do
  use Mix.Project

  def project do
    [
      app: :pygmy,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:cowboy, :ecto, :logger, :plug, :sqlite_ecto],
      mod: {Pygmy, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:sqlite_ecto, "~> 1.0.0"},
      {:ecto, "~> 1.0"}
    ]
  end
end
