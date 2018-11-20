defmodule OEmbed do
  @moduledoc """
  oEmbed consumer library for Elixir applications.
  """

  @core_providers [
    OEmbed.InstagramProvider,
    OEmbed.PinterestProvider,
    OEmbed.VimeoProvider
  ]

  @fallback_providers [OEmbed.DiscoverableProvider]

  @doc """
  Get oEmbed structure for given URL.

  ## Example

  ```elixir
  {:ok, result} = OEmbed.for("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
  ```
  """
  def for(""), do: {:error, "Empty URL"}

  def for(url) when is_binary(url) do
    case Enum.find(get_providers(), fn provider -> provider.provides?(url) end) do
      nil ->
        {:error, "oEmbed not found"}

      provider ->
        provider.get(url)
    end
  end

  def for(_), do: {:error, "Invalid URL format"}

  defp get_providers do
    @core_providers ++ third_party_providers() ++ @fallback_providers
  end

  defp third_party_providers do
    Application.get_env(:oembed, :providers)
  end
end
