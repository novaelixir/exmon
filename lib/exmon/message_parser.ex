defmodule Exmon.MessageParser do
  def parse(file) do
    file
    |> File.read!
    |> String.split("\n")
    |> Stream.chunk_by(fn x -> x == "" end)
    |> Stream.filter(fn x -> x != [""] end)
    |> IO.inspect
    |> process_messages
  end

  def process_messages(messages) do
    Enum.map(messages, &process_message/1)
  end

  def process_message(message) do
    spawn fn ->
      # IO.puts "#{inspect self} processing #{inspect message}\n"
      Enum.reduce(message, %{}, fn line, acc ->
        try do
          [key,value] = String.split(line, "=", parts: 2)
          Map.put(acc, key, value)
        rescue
          e ->
            IO.puts "throwing out #{line} b/c it is not so awesome!!!!"
            acc
        end
      end)
      |> IO.inspect
    end
  end
end
