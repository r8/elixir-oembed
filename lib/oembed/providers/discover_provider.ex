defmodule OEmbed.DiscoverProvider do
  alias OEmbed.{Link, Photo, Rich, Video}

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

  def get_oembed(url) do
    with {:ok, %HTTPoison.Response{body: body}} <- HTTPoison.get(url, [], [follow_redirect: true, ssl: [{:versions, [:'tlsv1.2']}]]),
    {:ok, struct} <- Poison.decode(body),
    resource <- get_resource(struct) do
      {:ok, resource}
    else
      _ -> {:error, "oEmbed url not found"}
    end
  end

  defp get_resource(%{"type" => "link"} = struct), do: Link.new(struct)
  defp get_resource(%{"type" => "photo"} = struct), do: Photo.new(struct)
  defp get_resource(%{"type" => "rich"} = struct), do: Rich.new(struct)
  defp get_resource(%{"type" => "video"} = struct), do: Video.new(struct)
  defp get_resource(struct), do: struct
end
