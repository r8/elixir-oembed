defmodule OEmbed.Resource do
  @moduledoc """
  oEmbed resource
  """

  @keys []
  @requred_keys []

  defmacro __using__(_) do
    quote do
      @common_keys [type: nil, version: "1.0", title: nil,
                      author_name: nil, author_url: nil,
                      provider_name: nil, provider_url: nil, cache_age: nil,
                      thumbnail_url: nil, thumbnail_width: nil,
                      thumbnail_height: nil]

      @enforce_keys @requred_keys
      defstruct @common_keys ++ @keys
    end
  end
end
