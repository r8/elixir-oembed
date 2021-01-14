# OEmbed

![CI](https://github.com/r8/elixir-oembed/workflows/CI/badge.svg)
[![Hex.pm](https://img.shields.io/hexpm/v/oembed.svg?style=flat-square)](https://hex.pm/packages/oembed)
[![Hex.pm](https://img.shields.io/hexpm/dt/oembed.svg?style=flat-square)](https://hex.pm/packages/oembed)

oEmbed consumer library for Elixir applications.

> oEmbed is a format for allowing an embedded representation of a URL on third party sites. The simple API allows a website to display embedded content (such as photos or videos) when a user posts a link to that resource, without having to parse the resource directly.
>
> -- See [oembed.com](http://oembed.com) for more info about the protocol.

This library supports any discoverable oEmbed endpoint and some other services via custom adapters.
Among them:

  - YouTube
  - Instagram
  - Pinterest
  - Vimeo

## Installation

Add `oembed` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:oembed, "~> 0.4.1"}]
end
```

## Usage

```elixir
{:ok, result} = OEmbed.for("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
```

## Custom providers

You can implement modules that support provider behaviour and add them to the provider list from your app config

```elixir
config :oembed, :providers, [MyApp.OEmbed.SomeProvider, MyApp.OEmbed.SomeOtherProvider]
```
