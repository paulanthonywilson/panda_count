defmodule PandaCount.DnaCount do

  @moduledoc """
  For fun, illustrate counting individual "bases" with recursion.

  (When I say bases, we're really just counting letters.)
  """

  def countline(line) do
    countline(String.graphemes(line), %{})
  end

  defp countline([], acc), do: acc
  defp countline([char | rest], acc) do
    new_acc = Map.update(acc, char, 1, & &1 + 1)
    countline(rest, new_acc)
  end
end
