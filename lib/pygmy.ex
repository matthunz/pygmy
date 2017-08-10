defmodule Pygmy do
  use Application
  import Ecto.Query
  import Supervisor.Spec

  alias Pygmy.Repo
  @port 4000

  def start(_type, _args) do
    children =[
      Plug.Adapters.Cowboy.child_spec(:http, Pygmy, [], port: @port),
      supervisor(Pygmy.Repo, [])
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def init(default_opts) do
    IO.puts "Starting up Pygmy..."
    default_opts
  end

  def call(conn, _opts) do
    route(conn.method, conn.path_info, conn)
  end

  def route("GET", [short_url], conn) do
    query = from l in "links",
      where: l.short_url == ^short_url,
      select: l.long_url

    case Repo.one(query) do
      nil ->
        conn |> Plug.Conn.resp(404, "URL not found")
      long_url ->
        conn
        |> Plug.Conn.put_resp_header("location", long_url)
        |> Plug.Conn.resp(301, "Redirecting...")
    end
  end

  def route("POST", _, conn) do
    short_url = Pygmy.UrlGen.new
    Repo.insert!(%Link{
      short_url: short_url,
      long_url: "http://example.com"
    })

    full_url = fn ->
      port = case @port do
        80 ->
          ""
        _ ->
          ":" <> Integer.to_string(@port)
      end

      "http://" <> conn.host <> port <> "/" <> short_url
    end

    conn |> Plug.Conn.resp(200, full_url.())
  end

  def route(_, _, conn) do
    conn |> Plug.Conn.resp(404, "URL not found")
  end
end
