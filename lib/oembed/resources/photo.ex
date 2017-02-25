defmodule OEmbed.Photo do
  @moduledoc """
  oEmbed Photo resource.
  """

  @keys [type: "photo", url: nil, width: nil, height: nil]

  @requred_keys [:url, :width, :height]

  use OEmbed.Resource
end
