defmodule OEmbed.Rich do

  @keys [type: "rich", html: nil, width: nil, height: nil]

  @requred_keys [:html, :width, :height]

  use OEmbed.Resource
end
