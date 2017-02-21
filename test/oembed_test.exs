defmodule OEmbedTest do
  use ExUnit.Case
  doctest OEmbed

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "for" do
    IO.inspect OEmbed.for("https://www.youtube.com/watch?v=K4aeibd1Rrc")
    IO.inspect OEmbed.for("http://www.youtube.com/watch?v=K4aeibd1Rrc")
    IO.inspect OEmbed.for("https://www.instagram.com/p/BQwNhqoADJn/")
    IO.inspect OEmbed.for("http://www.instagram.com/p/BQwNhqoADJn/")
    IO.inspect OEmbed.for("http://www.instagram.com/p/BQ/")
    IO.inspect OEmbed.for("https://www.youtube.com/watch?v=K4a")
    IO.inspect OEmbed.for("https://www.google.com")
  end
end
