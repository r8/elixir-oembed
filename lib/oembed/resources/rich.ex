defmodule OEmbed.Rich do
  @moduledoc """
  oEmbed Rich resource.
  """

  @keys [type: "rich", html: nil, width: nil, height: nil]

  use OEmbed.Resource
end
