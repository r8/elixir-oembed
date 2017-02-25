defmodule OEmbed.Rich do
  @moduledoc """
  oEmbed Rich resource.
  """

  @keys [type: "rich", html: nil, width: nil, height: nil]

  @requred_keys [:html, :width, :height]

  use OEmbed.Resource
end
