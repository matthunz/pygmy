defmodule Pygmy do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    children =[
      Plug.Adapters.Cowboy.child_spec(:http, Pygmy, []),
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

  def route(_, _, conn) do
    conn |> Plug.Conn.resp(404, "URL not found")
  end
end
