ExUnit.start()

Application.ensure_all_started(:mox)

defmodule MoxTest do
  defmodule PubSub do
    @type t :: atom
    @type topic :: binary
    @type message :: term

    @callback subscribe(t, topic) :: :ok | {:error, term}
    @callback broadcast(t, topic, message) :: :ok | {:error, term}
  end

  defmodule Logger do
    @type message :: binary

    @callback info(message) :: :ok
  end
end

Mox.defmock(Test.BinanceMock, for: Madman.BinanceMock)
Mox.defmock(Test.TradeRebot.LeaderMock, for: Madman.TradeRobot.Leader)
Mox.defmock(Test.LoggerMock, for: MoxTest.Logger)
Mox.defmock(Test.PubSubMock, for: MoxTest.PubSub)
