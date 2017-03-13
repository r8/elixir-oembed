defmodule OEmbed.PinterestProvider do
  @moduledoc """
  oEmbed provider for Pinterest URLs.
  """
  use OEmbed.Provider

  alias OEmbed.Rich

  @doc """
  Check if this provider supports given URL.
  """
  def provides?(url) do
    Regex.match?(~r/^(?:http|https):\/\/(?:[A-Za-z]+\.)?pinterest\.com\/[A-Za-z0-9-_\/]+/i, url)
  end

  @doc """
  Get oEmbed result for given URL.
  """
  def get(url) do
    oembed = Rich.new(%{
      html: get_pin_html(url)
    })

    {:ok, oembed}
  end

  defp get_pin_html(url) do
    """
      <a data-pin-do="embedPin" data-pin-width="large" href="#{url}"></a>
      <script async defer src="//assets.pinterest.com/js/pinit.js"></script>
    """
  end
end
