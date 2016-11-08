defmodule PandaCount.DnaStream do
  alias Experimental.Flow

  @moduledoc """
  Use Experimental.Flow from gen_stage, to efficiently count bases using
  the available cores.

  Almost entirely based on the example shown in
  https://hexdocs.pm/gen_stage/0.8.0/Experimental.Flow.html

  For what it's worth, the results from counting Giant Panda DNA, downloaded from
  http://hgdownload.cse.ucsc.edu/goldenPath/ailMel1/bigZips/ (ailMel1.fa.gz uncompressed) are:

  ```
  %{"A" => 396_330_932,
    "C" => 289_474_171,
    "G" => 289_020_729,
    "T" => 395_792_059,

    "a" => 259_768_512,
    "c" => 177_840_139,
    "g" => 177_727_229,
    "t" => 259_359_060,

    "N" =>  51_805_609,
    "n" =>   2_390_575,
    }
  ```

  (Lower-case letters are somehow associated with repeating sequences, I believe. As are `n` and `N`.)
  """

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
