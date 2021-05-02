defmodule OEmbed.Mixfile do
  use Mix.Project

  @version "0.4.1"

  def project do
    [
      app: :oembed,
      version: @version,
      elixir: "~> 1.11",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      extra_applications: [:logger],
      env: [providers: []]
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
      source_url: "https://github.com/r8/elixir-oembed",
      source_ref: "v#{@version}",
      main: "readme",
      extras: ["README.md"]
    ]
  end

  defp description do
    """
    oEmbed consumer library for Elixir applications.
    """
  end

  defp package do
    [
      maintainers: ["Sergey Storchay"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/r8/elixir-oembed"}
    ]
  end
end
