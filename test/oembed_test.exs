defmodule OEmbedTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias OEmbed.Video
  alias OEmbed.Rich

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

  test "gets rich oembed for valid instagram url" do
    use_cassette "instagram_valid" do
      {:ok, %Rich{} = oembed} = OEmbed.for("https://www.instagram.com/p/7OZIdGDvFT/")
      assert oembed.html =~ "instagram-media"
    end
  end

  test "gets rich oembed for valid instagram short url" do
    use_cassette "instagram_short_valid" do
      {:ok, %Rich{} = oembed} = OEmbed.for("http://instagr.am/p/7OZIdGDvFT/")
      assert oembed.html =~ "instagram-media"
    end
  end

  test "gets error respone for invalid instagram url" do
    use_cassette "instagram_invalid" do
      {:error, _} = OEmbed.for("https://www.instagram.com/p/invalid_url/")
    end
  end
end
