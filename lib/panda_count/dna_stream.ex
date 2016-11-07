defmodule PandaCount.DnaStream do

  def countbases(stream) do
    stream
    |> Enum.filter(& !String.starts_with?(&1, ">"))
    |> Enum.flat_map(& String.split(&1, ""))
    |> Enum.reduce(%{}, fn
      "", acc -> acc
      "\n", acc -> acc
      base, acc -> Map.update(acc, base, 1, & &1 + 1)
    end)
  end
end
