defmodule OEmbed.Photo do
  @moduledoc """
  oEmbed Photo resource.
  """

  @keys [type: "photo", url: nil, width: nil, height: nil]

  use OEmbed.Resource
end
