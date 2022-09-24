defmodule Madman.TradeRobot.Supervisor do
  @moduledoc """
  Supervisor
  """

  use Supervisor

  alias Madman.TradeRobot.DynamicSymbolSupervisor

  @registry :madman_symbol_supervisors

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def init(_init_arg) do
    children = [
      {Registry, [keys: :unique, name: @registry]},
      {DynamicSymbolSupervisor, []},
      {Task,
       fn ->
         DynamicSymbolSupervisor.autostart_workers()
       end}
    ]

    Supervisor.init(children, strategy: :rest_for_one)
  end
end
