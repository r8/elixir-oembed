defmodule OEmbedTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias OEmbed.Video
  alias OEmbed.Rich

  test "gets error response for nil" do
    {:error, _} = OEmbed.for(nil)
  end

  test "gets error response for empty string" do
    {:error, _} = OEmbed.for("")
  end

  test "gets video oembed for valid youtube url" do
    use_cassette "youtube_valid" do
      {:ok, %Video{} = oembed} = OEmbed.for("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
      assert oembed.html =~ "<iframe"
    end
  end

  test "gets error response for invalid youtube url" do
    use_cassette "youtube_invalid" do
      {:error, _} = OEmbed.for("https://www.youtube.com/watch?v=invalid_url")
    end
  end

  test "gets rich oembed for valid instagram url" do
    use_cassette "instagram_valid" do
      {:ok, %Rich{} = oembed} = OEmbed.for("https://www.instagram.com/p/BaOHwvclrzJ/")
      assert oembed.html =~ "instagram-media"
    end
  end

  test "gets rich oembed for valid instagram short url" do
    use_cassette "instagram_short_valid" do
      {:ok, %Rich{} = oembed} = OEmbed.for("http://instagr.am/p/BaOHwvclrzJ/")
      assert oembed.html =~ "instagram-media"
    end
  end

  test "gets error response for invalid instagram url" do
    use_cassette "instagram_invalid" do
      {:error, _} = OEmbed.for("https://www.instagram.com/p/invalid_url/")
    end
  end

  test "gets rich oembed for valid pinterest pin url" do
    use_cassette "pinterest_pin_valid" do
      {:ok, %Rich{} = oembed} = OEmbed.for("https://www.pinterest.com/pin/731483164446834719/")
      assert oembed.html =~ "embedPin"
    end
  end

  test "gets error response for invalid pinterest url" do
    use_cassette "pinterest_pin_invalid" do
      {:error, _} = OEmbed.for("https://www.pinterest.com/pin/invalid_url/")
    end
  end

  test "gets oembed for valid url with relative oembed api link using http" do
    use_cassette "playbuzz_http_valid" do
      {:ok, %Rich{} = oembed} = OEmbed.for("http://www.playbuzz.com/avibwx10/every-southerner-must-have-these-eats-at-least-once")
      assert oembed.html =~ "pb_feed"
    end
  end

  test "gets oembed for valid url with relative oembed api link using https" do
    use_cassette "playbuzz_https_valid" do
      {:ok, %Rich{} = oembed} = OEmbed.for("https://www.playbuzz.com/avibwx10/every-southerner-must-have-these-eats-at-least-once")
      assert oembed.html =~ "pb_feed"
    end
  end
end
