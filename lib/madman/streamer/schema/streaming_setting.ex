defmodule Madman.Streamer.Schema.StreamingSetting do
  use Ecto.Schema

  alias Madman.Streamer.Schema.StreamingStatusEnum

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "streaming_settings" do
    field(:symbol, :string)
    field(:status, StreamingStatusEnum)

    timestamps()
  end
end
