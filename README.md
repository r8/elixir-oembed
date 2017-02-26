# OEmbed

[![Build Status](https://travis-ci.org/r8/elixir-oembed.svg?branch=master)](https://travis-ci.org/r8/elixir-oembed)
[![Deps Status](https://beta.hexfaktor.org/badge/all/github/r8/elixir-oembed.svg)](https://beta.hexfaktor.org/github/r8/elixir-oembed)
[![Inline docs](http://inch-ci.org/github/r8/elixir-oembed.svg?branch=master&style=flat)](http://inch-ci.org/github/r8/elixir-oembed)
[![Ebert](https://ebertapp.io/github/r8/elixir-oembed.svg)](https://ebertapp.io/github/r8/elixir-oembed)
[![Hex.pm](https://img.shields.io/hexpm/v/oembed.svg?style=flat-square)](https://hex.pm/packages/oembed)
[![Hex.pm](https://img.shields.io/hexpm/dt/oembed.svg?style=flat-square)](https://hex.pm/packages/oembed)

oEmbed consumer library for Elixir applications.

> oEmbed is a format for allowing an embedded representation of a URL on third party sites. The simple API allows a website to display embedded content (such as photos or videos) when a user posts a link to that resource, without having to parse the resource directly.
>
> -- See [oembed.com](http://oembed.com) for more info about the protocol.

This library supports any discoverable oEmbed endpoint and some other services via custom adapters.
Among them:

  - Instagram
  - Pinterest

## Installation

Add `oembed` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:oembed, "~> 0.1.0"}]
end
```

## Usage

```elixir
{:ok, result} = OEmbed.for("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
```
