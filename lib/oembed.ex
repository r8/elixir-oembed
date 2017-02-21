defmodule OEmbed do
  @moduledoc """
  oEmbed consumer for Elixir.
  """

  def for(url) do
    OEmbed.DiscoverProvider.get(url)
  end
end
