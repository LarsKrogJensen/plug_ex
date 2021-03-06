defmodule PlugEx do
  @moduledoc """
  Hahahah
  """
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

    hello()
    IO.inspect(sum(1, 2))

    MapSet.new()
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @doc """
  Hey
  """
  @spec sum(integer, integer) :: integer
  def sum(a, b) do
    a + b
  end

  @spec hello() :: :world
  def hello() do
    :world
  end
end
