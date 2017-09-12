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
    case get_page_type(url) do
      {:ok, "pin"} ->
        oembed = Rich.new(%{
          html: get_pin_html(url)
        })
        {:ok, oembed}
      _ ->
        {:error, "Error getting oEmbed"}
    end
  end

  defp get_page_type(url) do
    with {:ok, %HTTPoison.Response{body: html}} <- HTTPoison.get(url, [], [follow_redirect: true, ssl: [{:versions, [:'tlsv1.2']}]]),
      [_ | _] = tags <- Floki.find(html, "head meta[property='og:type']"),
       {"meta", attributes, _} <- List.first(tags),
       %{"content" => content} <- Enum.into(attributes, %{}),
       %{"type" => type} <- Regex.named_captures(~r/^pinterestapp\:(?<type>.+)/, content) do
        {:ok, type}
    else
      _ -> {:error, "Error getting page type"}
    end
  end

  defp get_pin_html(url) do
    """
      <a data-pin-do="embedPin" data-pin-width="large" href="#{url}"></a>
      <script async defer src="//assets.pinterest.com/js/pinit.js"></script>
    """
  end
end
