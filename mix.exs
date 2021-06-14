defmodule TwelveDays.MixProject do
  use Mix.Project

  def project do
    [
      app: :twelve_days,
      version: "0.1.0",
      aliases: aliases(),
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :plug_cowboy],
      mod: {TwelveDays.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:credo, "~> 1.3", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.21.3", only: :dev, runtime: false},
      {:inch_ex, github: "rrrene/inch_ex", only: [:dev, :test]},
      {:excoveralls, "~> 0.12.3", only: :test},
      {:plug_cowboy, "~> 2.2"},
      {:poison, "~> 4.0.1"}
    ]
  end

  def aliases do
    [
      test_ci: [
        "test",
        "coveralls"
      ],
      code_review: [
        "dialyzer",
        "credo --strict"
      ],
      generate_docs: [
        "docs",
        "inch"
      ],
      test: "test --no-start"
    ]
  end
end
