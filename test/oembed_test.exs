defmodule OEmbedTest do
  use ExUnit.Case
  doctest OEmbed

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "for" do
    OEmbed.for("https://www.youtube.com/watch?v=K4aeibd1Rrc")
  end
end
