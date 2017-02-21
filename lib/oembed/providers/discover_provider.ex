defmodule OEmbed.DiscoverProvider do
  use OEmbed.Provider

  def provides?(_) do
    true
  end

  def get(url) do
    with {:ok, href} <- discover(url),
      {:ok, oembed} <- get_oembed(href) do
        {:ok, oembed}
    else
      _ ->
        {:error, "oEmbed not found"}
    end
  end

  def discover(url) do
    with {:ok, %HTTPoison.Response{body: html}} <- HTTPoison.get(url, [], [follow_redirect: true, ssl: [{:versions, [:'tlsv1.2']}]]),
      [_ | _] = tags <- Floki.find(html, "head link[type='application/json+oembed']"),
       {"link", attributes, _} <- List.first(tags),
       %{"href" => href} <- Enum.into(attributes, %{}) do
        {:ok, href}
    else
      _ -> {:error, "oEmbed url not found"}
    end
  end
end
