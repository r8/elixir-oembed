defmodule OEmbed.VimeoProvider do
  @moduledoc """
  oEmbed provider for Vimeo URLs.
  """
  use OEmbed.Provider

  @oembed_endpoint "https://vimeo.com/api/oembed.json?url="

  @doc """
  Check if this provider supports given URL.
  """
  def provides?(url) do
    Regex.match?(~r/(.*\.)?vimeo\.com\//, url)
  end

  @doc """
  Get oEmbed result for given URL.
  """
  def get(url) do
    get_oembed(@oembed_endpoint <> URI.encode(url, &URI.char_unreserved?/1))
  end
end
