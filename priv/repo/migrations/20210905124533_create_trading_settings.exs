defmodule Madman.Repo.Migrations.CreateTradingSettings do
  use Ecto.Migration

  alias Madman.TradeRobot.Schema.TradingStatusEnum

  def change do
    TradingStatusEnum.create_type()

    create table(:trading_settings, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:symbol, :text, null: false)
      add(:chunks, :integer, null: false)
      add(:budget, :decimal, null: false)
      add(:buy_down_interval, :decimal, null: false)
      add(:profit_interval, :decimal, null: false)
      add(:rebuy_interval, :decimal, null: false)
      add(:status, TradingStatusEnum.type(), default: "off", null: false)

      timestamps()
    end

    create(unique_index(:trading_settings, [:symbol]))
  end
end
