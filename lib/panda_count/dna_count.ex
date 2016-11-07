defmodule PandaCount.DnaCount do

  def countline(line) do
    countline(String.split(line, ""), %{})
  end


  def countline([], acc), do: acc

  def countline(["" | rest ], acc) do
    countline(rest, acc)
  end

  def countline([char | rest ], acc) do
    new_acc = Map.update(acc, char, 1, fn old -> old + 1 end)
    countline(rest, new_acc)
  end
end
