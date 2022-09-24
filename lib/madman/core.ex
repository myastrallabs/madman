defmodule Madman.Core do
  @moduledoc """
  Core
  """
  alias Madman.Subscriber.DynamicSupervisor

  def start_storing(stream, symbol) do
    to_topic(stream, symbol)
    |> DynamicSupervisor.start_worker()
  end

  def stop_storing(stream, symbol) do
    to_topic(stream, symbol)
    |> DynamicSupervisor.stop_worker()
  end

  @doc """
  ## Examples

      iex> Madman.Core.start_storing("ORDERS", "XRPUSDT")
      iex> Madman.TradeRobot.start_trading("XRPUSDT")
      iex> args = %{ type: :trade_events, symbol: "XRPUSDT", from: "2019-06-02", to: "2019-06-04", interval: 5 }
      iex> Madman.Core.publish_data(args)

  """
  def publish_data(args) do
    Madman.Publisher.start_link(args)
  end

  defp to_topic(stream, symbol) do
    [stream, symbol]
    |> Enum.map(&String.upcase/1)
    |> Enum.join(":")
  end
end
