defmodule OEmbed.Photo do

  @keys [type: "photo", url: nil, width: nil, height: nil]

  @requred_keys [:url, :width, :height]

  use OEmbed.Resource
end
