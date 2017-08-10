defmodule Link do
  use Ecto.Model

  schema "links" do
    field :short_url, :string
    field :long_url, :string

    timestamps
  end
end
