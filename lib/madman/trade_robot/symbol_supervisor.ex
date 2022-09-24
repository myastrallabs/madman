defmodule Madman.TradeRobot.SymbolSupervisor do
  use Supervisor

  require Logger

  def start_link(symbol) do
    Supervisor.start_link(
      __MODULE__,
      symbol,
      name: via_tuple(symbol)
    )
  end

  def init(symbol) do
    Logger.info("Starting new supervision tree to trade on #{symbol}")

    Supervisor.init(
      [
        {
          DynamicSupervisor,
          strategy: :one_for_one, name: :"Madman.TradeRobot.DynamicTraderSupervisor-#{symbol}"
        },
        {Madman.TradeRobot.Leader, symbol}
      ],
      strategy: :one_for_all
    )
  end

  defp via_tuple(symbol) do
    {:via, Registry, {:madman_symbol_supervisors, symbol}}
  end
end
