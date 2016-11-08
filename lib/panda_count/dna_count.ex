defmodule PandaCount.DnaCount do

  def countline(line) do
    countline(String.graphemes(line), %{})
  end


  defp countline([], acc), do: acc
  defp countline([char | rest ], acc) do
    new_acc = Map.update(acc, char, 1, fn old -> old + 1 end)
    countline(rest, new_acc)
  end
end
