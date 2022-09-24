defmodule Madman.MixProject do
  use Mix.Project

  def project do
    [
      app: :madman,
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Madman.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:ecto_enum, "~> 1.4"},
      {:phoenix_pubsub, "~> 2.0"},
      {:postgrex, ">= 0.0.0"},
      {:websockex, "~> 0.4.2"},
      {:binance, "~> 1.0"},
      {:jason, "~> 1.2"},
      {:decimal, "~> 2.0"},
      {:mox, "~> 1.0"}
    ]
  end

  defp aliases do
    [
      seed: ["run priv/seed_trade_settings.exs", "run priv/seed_streamer_settings.exs"]
    ]
  end
end
