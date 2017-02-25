defmodule OEmbedTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias OEmbed.Video

  test "gets video oembed for valid youtube url" do
    use_cassette "youtube_valid" do
      {:ok, %Video{} = oembed} = OEmbed.for("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
      assert oembed.html =~ "<iframe"
    end
  end
end
