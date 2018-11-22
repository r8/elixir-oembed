defmodule OEmbed.Resource do
  @moduledoc """
  oEmbed resource.
  """

  defmacro __using__(_) do
    quote do
      @derive [Poison.Encoder]

      @common_keys [
        type: nil,
        version: "1.0",
        title: nil,
        author_name: nil,
        author_url: nil,
        provider_name: nil,
        provider_url: nil,
        cache_age: nil,
        thumbnail_url: nil,
        thumbnail_width: nil,
        thumbnail_height: nil
      ]

      defstruct @common_keys ++ @keys

      use ExConstructor
    end
  end
end
