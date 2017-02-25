defmodule OEmbed.Video do
  @moduledoc """
  oEmbed Video resource.
  """

  @keys [type: "video", html: nil, width: nil, height: nil]

  @requred_keys [:html, :width, :height]

  use OEmbed.Resource
end
