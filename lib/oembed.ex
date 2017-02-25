defmodule OEmbed do
  @moduledoc """
  oEmbed consumer library for Elixir applications.

  ## Usage

  ```elixir
  {:ok, result} = OEmbed.for("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
  ```
  """

  @core_providers [OEmbed.InstagramProvider,
                   OEmbed.PinterestProvider,
                   OEmbed.DiscoverableProvider]

  @doc """
  Get oEmbed structure for given URL.

  ## Example

  ```elixir
  {:ok, result} = OEmbed.for("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
  ```
  """
  def for(url) do
    case Enum.find(get_providers(), fn(provider) -> provider.provides?(url) end) do
      nil ->
        {:error, "oEmbed not found"}
      provider ->
        provider.get(url)
    end
  end

  defp get_providers do
    @core_providers
  end
end
