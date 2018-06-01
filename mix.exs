defmodule MyServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_server,
      version: "0.1.0",
      elixir: "~> 1.7-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir,          "~> 0.5", only: [:dev], runtime: false},
    ]
  end
end
