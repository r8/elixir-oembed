defmodule OEmbed.Video do
  @moduledoc """
  oEmbed Video resource.
  """

  @keys [type: "video", html: nil, width: nil, height: nil]

  use OEmbed.Resource
end
