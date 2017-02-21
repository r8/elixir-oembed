defmodule OEmbed.DiscoverProvider do

  def get(url) do
    IO.inspect discover(url)
  end

  def discover(url) do
    HTTPoison.get("https://example.com/", [], [ ssl: [{:versions, [:'tlsv1.2']}] ])
  end
end
