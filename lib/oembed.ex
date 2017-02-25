defmodule OEmbed do
  @moduledoc """
  oEmbed consumer library for Elixir applications.
  """

  @core_providers [OEmbed.InstagramProvider,
                   OEmbed.PinterestProvider,
                   OEmbed.DiscoverProvider]

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
