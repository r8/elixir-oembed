defmodule OEmbed.Photo do
  use OEmbed.Resource

  @fields [:url, :width, :height]

  defstruct @common_fields ++ @fields
end
