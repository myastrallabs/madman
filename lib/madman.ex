defmodule Madman do
  @moduledoc """
  Documentation for `Madman`.

  ## TODO's

    - [ ] filter(list) by trading setting (symbol and status)
    - [ ] quick close trade button
    - [ ] show trade infomations

  """

  import Ecto.Query, warn: false

  alias Madman.Repo
  alias Madman.TradeRobot.Schema.TradingSetting
  alias Madman.Core.Schema.Order

  def list_trading_settings() do
    from(ts in TradingSetting, order_by: [asc: ts.status])
    |> Repo.all()
  end

  def get_trading_setting(id) do
    Repo.get!(TradingSetting, id)
  end

  def update_trading_setting(content, attrs) do
    content
    |> TradingSetting.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Get Orders
  """
  def get_orders(symbol) do
    from(o in Order,
      where: o.symbol == ^symbol,
      order_by: [desc_nulls_last: o.update_time]
    )
    |> Repo.all()
  end

  @doc """
  启动订阅，并且入库
  Madman.start_streaming_and_storing("SOLUSDT")
  Madman.start_storing_and_trading("USDTUSDT")
  """
  def start_streaming_and_storing(symbol) do
    Madman.Streamer.start_streaming(symbol)
    Madman.Core.start_storing("TRADE_EVENTS", symbol)
  end

  @doc """
  订单入库。
  """
  def start_storing_and_trading(symbol) do
    Madman.Core.start_storing("ORDERS", symbol)
    Madman.TradeRobot.start_trading(symbol)
  end
end
