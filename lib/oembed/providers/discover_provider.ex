defmodule OEmbed.DiscoverProvider do

  def get(url) do
    with {:ok, href} <- discover(url),
      {:ok, oembed} <- get_oembed(href) do
        IO.inspect oembed
    else
      _ ->
        {:error, "oEmbed not found"}
    end
  end

  def discover(url) do
    with {:ok, %HTTPoison.Response{body: html}} <- HTTPoison.get(url, [], [ssl: [{:versions, [:'tlsv1.2']}]]),
      [_ | _] = tags <- Floki.find(html, "head link[type='application/json+oembed']"),
       {"link", attributes, _} <- List.first(tags),
       %{"href" => href} <- Enum.into(attributes, %{}) do
        {:ok, href}
    else
      _ -> {:error, "oEmbed url not found"}
    end
  end

  def get_oembed(url) do
    with {:ok, %HTTPoison.Response{body: body}} <- HTTPoison.get(url, [], [ssl: [{:versions, [:'tlsv1.2']}]]) do
      {:ok, body}
    else
      _ -> {:error, "oEmbed url not found"}
    end
  end
end
