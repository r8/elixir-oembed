defmodule OEmbed.Video do

  @keys [type: "video", html: nil, width: nil, height: nil]

  @requred_keys [:html, :width, :height]

  use OEmbed.Resource
end
