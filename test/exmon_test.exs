defmodule ExmonTest do
  use ExUnit.Case
  doctest Exmon

  test "we can break up messages" do
    Path.expand("fixtures/input_1.txt", __DIR__)
    |> Exmon.MessageParser.parse
    |> IO.inspect
  end

  test "we can break up messages with bad syntax" do
    Path.expand("fixtures/input_2.txt", __DIR__)
    |> Exmon.MessageParser.parse
    |> IO.inspect
  end

  test "process message works" do
    Exmon.MessageParser.process_message ["foo=bar", "baz=quux"]
  end

  test "the truth" do
    assert 1 + 1 == 2
  end
end
