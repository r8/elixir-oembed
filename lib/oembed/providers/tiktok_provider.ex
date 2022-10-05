defmodule OEmbed.TikTokProvider do
  @moduledoc """
  oEmbed provider for Tiktok URLs.
  """
  use OEmbed.Provider

  @oembed_endpoint "https://www.tiktok.com/oembed?url="

  @doc """
  Check if this provider supports given URL.
  """
  def provides?(url) do
    Regex.match?(
      ~r/(^|[^'"])(https?:\/\/(www\.)?tiktok\.com\/\@?(\w+)\/video?\/(\d+))/i,
      url
    )
  end

  @doc """
  Get oEmbed result for given URL.
  """
  def get(url) do
    get_oembed(@oembed_endpoint <> URI.encode(url, &URI.char_unreserved?/1))
  end
end
