defmodule OEmbed.DiscoverableProvider do
  @moduledoc """
  oEmbed provider for discoverable endpoints.
  """

  use OEmbed.Provider

  @doc """
  Check if this provider supports given URL.
  """
  def provides?(_) do
    true
  end

  @doc """
  Get oEmbed result for given URL.
  """
  def get(url) do
    with {:ok, href} <- discover(url),
      {:ok, oembed} <- get_oembed(href) do
        {:ok, oembed}
    else
      _ ->
        {:error, "oEmbed not found"}
    end
  end

  defp discover(url) do
    with {:ok, %HTTPoison.Response{body: html}} <- HTTPoison.get(url, [], [follow_redirect: true, ssl: [{:versions, [:'tlsv1.2']}]]),
         [_ | _] = tags <- Floki.find(html, "head link[type$='json+oembed']"),
         {"link", attributes, _} <- List.first(tags),
         %{"href" => href} <- Enum.into(attributes, %{}),
         oembed_url = %URI{} <- URI.merge(url, href)
    do
      {:ok, URI.to_string(oembed_url)}
    else
      _ -> {:error, "oEmbed url not found"}
    end
  end
end
