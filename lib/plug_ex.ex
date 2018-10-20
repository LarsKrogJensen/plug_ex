defmodule PlugEx do
  use Application
  require Logger

  def start(_type, _args) do
    port = Application.get_env(:plug_ex, :cowboy_port, 8080)
    Logger.info("Application started on port #{port}")

    children = [
      Plug.Adapters.Cowboy2.child_spec(
        scheme: :http,
        plug: PlugEx.Router,
        options: [
          port: port
        ]
      )
    ]

    IO.inspect sum(1, 2)

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @spec sum(integer, integer) :: integer
  def sum(a, b) do
    a + b
  end

  def hello() do
    :world
  end
end
