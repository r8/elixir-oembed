defmodule OEmbed.YoutubeProvider do
  @moduledoc """
  oEmbed provider for YouTube URLs.
  """
  use OEmbed.Provider

  @oembed_endpoint "http://www.youtube.com/oembed?format=json&url="

  @doc """
  Check if this provider supports given URL.
  """
  def provides?(url) do
    Regex.match?(~r/(?:(?:\?|&)(?:v|list)=|v\/|youtu\.be\/)((?!videoseries)[a-zA-Z0-9_]*)/, url)
  end

  @doc """
  Get oEmbed result for given URL.
  """
  def get(url) do
    get_oembed(@oembed_endpoint <> URI.encode(url, &URI.char_unreserved?/1))
  end
end
