defmodule Madman.Core.Schema.SubscriberSetting do
  use Ecto.Schema

  alias Madman.Core.Schema.SubscriberStatusEnum

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "subscriber_settings" do
    field(:topic, :string)
    field(:status, SubscriberStatusEnum)

    timestamps()
  end
end
