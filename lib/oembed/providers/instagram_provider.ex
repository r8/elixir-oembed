defmodule OEmbed.InstagramProvider do
  @moduledoc """
  oEmbed provider for Instagram URLs.
  """
  use OEmbed.Provider

  @oembed_endpoint "https://api.instagram.com/oembed?url="

  @doc """
  Check if this provider supports given URL.
  """
  def provides?(url) do
    Regex.match?(
      ~r/^(?:http|https):\/\/(?:www\.)?(?:instagram.com|instagr.am)\/(?:[A-Za-z0-9-_\/]+)$/i,
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
