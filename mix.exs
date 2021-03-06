defmodule TsvReader.MixProject do
  use Mix.Project

  def project do
    [
      app: :tsv_reader,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug, :poison, :remix, :env_helper],
      mod: {TsvReader.Application, []}
    ]
  end


  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.5"},
      {:poison, "~> 3.1"},
      {:remix, "~> 0.0.1"},
      {:env_helper, "~> 0.0.2"},
    ]
  end
end
