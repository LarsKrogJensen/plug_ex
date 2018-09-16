defmodule PlugEx do
  use Application
  require Logger

  def start(_type, _args) do
    Logger.info("Application started")
    port = Application.get_env(:plug_ex, :cowboy_port, 8080)
    Logger.info("  on port #{port}")
    children = [
      Plug.Adapters.Cowboy2.child_spec(scheme: :http, plug: PlugEx.Router, options: [port: port])
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end

end
