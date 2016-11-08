defmodule PandaCount.DnaStream do
  alias Experimental.Flow

  def countbases(stream) do
    stream
    |> Flow.from_enumerable()
    |> Flow.filter(& !String.starts_with?(&1, ">"))
    |> Flow.flat_map(& String.graphemes(&1))
    |> Flow.partition()
    |> Flow.reduce(fn -> %{} end, fn
      "\n", acc -> acc
      base, acc -> Map.update(acc, base, 1, & &1 + 1)
    end)
    |> Enum.into(%{})
  end
end
