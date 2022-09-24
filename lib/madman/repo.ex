defmodule Madman.Repo do
  use Ecto.Repo,
    otp_app: :madman,
    adapter: Ecto.Adapters.Postgres
end
