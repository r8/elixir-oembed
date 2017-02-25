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

  test "gets error respone for invalid youtube url" do
    use_cassette "youtube_invalid" do
      {:error, _} = OEmbed.for("https://www.youtube.com/watch?v=invalid_url")
    end
  end
end
