defmodule OEmbed.Provider do
  @moduledoc """
  oEmbed provider behaviour.
  """

  defmacro __using__(_) do
    quote do
      import OEmbed.Provider

      alias OEmbed.{Link, Photo, Rich, Video}

      @behaviour OEmbed.Provider

      defp get_oembed(url) do
         with {:ok, %HTTPoison.Response{body: body}} <- HTTPoison.get(url, [], [follow_redirect: true, ssl: [{:versions, [:'tlsv1.2']}]]),
         {:ok, struct} <- Poison.decode(body),
         resource <- get_resource(struct) do
           {:ok, resource}
         else
           _ -> {:error, "oEmbed url not found"}
         end
       end

       defp get_resource(%{"type" => "link"} = struct), do: Link.new(struct)
       defp get_resource(%{"type" => "photo"} = struct), do: Photo.new(struct)
       defp get_resource(%{"type" => "rich"} = struct), do: Rich.new(struct)
       defp get_resource(%{"type" => "video"} = struct), do: Video.new(struct)
       defp get_resource(struct), do: struct
    end
  end

  @callback provides?(String.t) :: boolean
  @callback get(String.t) :: struct
 end
