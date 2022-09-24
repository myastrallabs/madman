defmodule Madman.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Madman.Repo, []},
      {Phoenix.PubSub, name: Madman.PubSub, adapter_name: Phoenix.PubSub.PG2},
      {Madman.Core.Supervisor, []},
      {Madman.TradeRobot.Supervisor, []},
      {Madman.Streamer.Supervisor, []},
      {Madman.BinanceMock, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Madman.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
