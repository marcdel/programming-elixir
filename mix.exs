defmodule ProgrammingElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :programming_elixir,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [
      extra_applications: [:logger],
      mod: {StackSupervisor, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:triq, github: "triqng/triq", only: :test},
      {:excheck,  "~> 0.5.0", only: :test},
      {:credo, "~> 0.7", only: [:dev, :test]},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false},
    ]
  end
end
