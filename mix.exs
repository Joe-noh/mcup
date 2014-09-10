defmodule Mcup.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mcup,
      version: "0.0.2",
      elixir: ">= 1.0.0",
      description: desc,
      package: package,
      deps: deps
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end

  defp desc do
    """
    DSL for markup.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      contributors: ["Joe Honzawa"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Joe-noh/mcup"}
    ]
  end
end
