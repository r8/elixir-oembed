defmodule OEmbedTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias OEmbed.Rich
  alias OEmbed.Video

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

  test "gets error response for invalid youtube id" do
    use_cassette "youtube_invalid" do
      {:error, _} = OEmbed.for("https://www.youtube.com/watch?v=invalid_id")
    end
  end

  test "gets video oembed for valid youtube playlist" do
    use_cassette "youtube_playlist_valid" do
      {:ok, %Video{} = oembed} =
        OEmbed.for("https://www.youtube.com/playlist?list=PL634F2B56B8C346A2")

      assert oembed.html =~ "<iframe"
    end
  end

  test "gets video oembed for invalid youtube playlist" do
    use_cassette "youtube_playlist_invalid" do
      {:error, _} = OEmbed.for("https://www.youtube.com/playlist?list=invalid_list")
    end
  end

  test "gets video oembed for valid youtu.be url" do
    use_cassette "youtu_be_valid" do
      {:ok, %Video{} = oembed} = OEmbed.for("https://youtu.be/dQw4w9WgXcQ")
      assert oembed.html =~ "<iframe"
    end
  end

  test "gets error response for invalid youtu.be id" do
    use_cassette "youtu_be_invalid" do
      {:error, _} = OEmbed.for("https://youtu.be/invalid__id")
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

  test "gets rich oembed for valid twitter status url" do
    use_cassette "twitter_status_valid" do
      {:ok, %Rich{} = oembed} = OEmbed.for("https://twitter.com/jack/status/20")
      assert oembed.html =~ "just setting up my twttr"
    end
  end

  test "gets error response for invalid twitter url" do
    use_cassette "twitter_status_invalid" do
      {:error, _} = OEmbed.for("https://www.twitter.com/jack/status/invalid_url/")
    end
  end

  test "gets rich oembed for valid soundcloud url" do
    use_cassette "soundcloud_valid" do
      {:ok, %Rich{} = oembed} = OEmbed.for("https://soundcloud.com/forss/flickermood")
      assert oembed.html =~ "soundcloud.com/player"
    end
  end

  test "gets error response for invalid soundcloud url" do
    use_cassette "soundcloud_invalid" do
      {:error, _} = OEmbed.for("https://soundcloud.com/invalid_user/invalid_track")
    end
  end

  test "gets oembed for valid url with relative oembed api link using http" do
    use_cassette "playbuzz_http_valid" do
      {:ok, %Rich{} = oembed} =
        OEmbed.for(
          "http://www.playbuzz.com/avibwx10/every-southerner-must-have-these-eats-at-least-once"
        )

      assert oembed.html =~ "pb_feed"
    end
  end

  test "gets oembed for valid url with relative oembed api link using https" do
    use_cassette "playbuzz_https_valid" do
      {:ok, %Rich{} = oembed} =
        OEmbed.for(
          "https://www.playbuzz.com/avibwx10/every-southerner-must-have-these-eats-at-least-once"
        )

      assert oembed.html =~ "pb_feed"
    end
  end

  test "gets rich oembed for valid vimeo url" do
    use_cassette "vimeo_valid", match_requests_on: [:query] do
      {:ok, %Video{} = oembed} = OEmbed.for("https://player.vimeo.com/videos/123123123/")

      assert oembed.html =~ "vimeo"
    end
  end
end
