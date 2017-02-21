defmodule OEmbed.InstagramProvider do
  use OEmbed.Provider

  @oembed_endpoint "https://api.instagram.com/oembed?url="

  def provides?(url) do
    Regex.match?(~r/^(?:(?:http|https):\/\/)?(?:www.)?(?:instagram.com|instagr.am)\/([A-Za-z0-9-_]+)/im, url)
  end

  def get(url) do
    get_oembed(@oembed_endpoint <> url)
  end
end
