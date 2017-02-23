defmodule OEmbed.PinterestProvider do
  use OEmbed.Provider

  alias OEmbed.Rich

  def provides?(url) do
    Regex.match?(~r/^(?:(?:http|https):\/\/)?(?:[A-Za-z0-9-_]+\.)*?(?:pinterest.com)\/(?:pin)?\/(?:[0-9-_]+)/im, url)
  end

  def get(url) do
    oembed = Rich.new(%{
      html: get_pin_html(url)
    })

    {:ok, oembed}
  end

  def get_pin_html(url) do
    """
      <a data-pin-do="embedPin" data-pin-width="large" href="#{url}"></a>
      <script async defer src="//assets.pinterest.com/js/pinit.js"></script>
    """
  end
end
