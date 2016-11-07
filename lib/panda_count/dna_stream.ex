defmodule PandaCount.DnaStream do

  def countbases(stream) do
    stream
    |> Stream.filter(& !String.starts_with?(&1, ">"))
    |> Stream.flat_map(& String.graphemes(&1))
    |> Enum.reduce(%{}, fn
      "\n", acc -> acc
      base, acc -> Map.update(acc, base, 1, & &1 + 1)
    end)
  end
end
