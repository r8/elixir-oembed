defmodule OEmbedTest do
  use ExUnit.Case
  doctest OEmbed

  test "the truth" do
    photo = %OEmbed.Photo{}

    IO.inspect photo
  end
end
