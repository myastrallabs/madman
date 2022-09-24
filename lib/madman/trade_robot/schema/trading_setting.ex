defmodule Madman.TradeRobot.Schema.TradingSetting do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  alias Madman.TradeRobot.Schema.TradingStatusEnum

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "trading_settings" do
    field(:symbol, :string)
    field(:chunks, :integer)
    field(:budget, :decimal)
    field(:buy_down_interval, :decimal)
    field(:profit_interval, :decimal)
    field(:rebuy_interval, :decimal)
    field(:status, TradingStatusEnum)

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    required_fields = ~w(chunks budget buy_down_interval profit_interval rebuy_interval status)a

    article
    |> cast(attrs, required_fields)
    |> validate_required(required_fields)
  end
end
