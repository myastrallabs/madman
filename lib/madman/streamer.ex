defmodule Madman.Streamer do
  @moduledoc """
  """

  alias Madman.Repo
  alias Madman.Streamer.Schema.StreamingSetting
  alias Madman.Streamer.DynamicStreamerSupervisor

  @doc """
  Start streaming.

  ## Examples

    iex> Madman.Streamer.start_streaming("SOLUSDT")

  """
  def start_streaming(symbol) do
    symbol
    |> String.upcase()
    |> DynamicStreamerSupervisor.start_worker()
  end

  def stop_streaming(symbol) do
    symbol
    |> String.upcase()
    |> DynamicStreamerSupervisor.stop_worker()
  end

  def list_streaming_settings() do
    Repo.all(StreamingSetting)
  end
end
