defmodule PandaCount.Mixfile do
  use Mix.Project

  def project do
    [app: :panda_count,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :gen_stage],
     mod: {PandaCount, []}]
  end

  defp deps do
    [
      {:gen_stage, "~> 0.4"},
      {:credo, ">= 0.0.0", only: [:dev, :test]},
    ]
  end
end
