defmodule OEmbed.Mixfile do
  use Mix.Project

  @source_url "https://github.com/r8/elixir-oembed"
  @version "0.4.1"

  def project do
    [
      app: :oembed,
      version: @version,
      elixir: "~> 1.11",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      env: [providers: []]
    ]
  end

  defp deps do
    [
      {:httpoison, ">= 0.9.0"},
      {:floki, ">= 0.24.0"},
      {:poison, ">= 1.5.0"},
      {:exconstructor, ">= 1.0.0"},
      {:exvcr, "~> 0.12", only: :test},
      {:inch_ex, ">= 0.0.0", only: :docs},
      {:earmark, ">= 0.0.0", only: :dev},
      {:ex_doc, "~> 0.24.2", only: :dev, runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md": [title: "Changelog"],
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: "https://github.com/r8/elixir-oembed",
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end

  defp package do
    [
      description: "oEmbed consumer library for Elixir applications.",
      maintainers: ["Sergey Storchay"],
      licenses: ["MIT"],
      links: %{
        "Changelog" => "https://hexodcs.pm/oembed/changelog.html",
        "Github" => @source_url
      }
    ]
  end
end
