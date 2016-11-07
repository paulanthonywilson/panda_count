defmodule PandaCount.DnaCountTest do
  use ExUnit.Case

  alias PandaCount.DnaCount

  test "empty string" do
    assert %{} == DnaCount.countline("")
  end

  test "line with one of each base" do
    assert %{"A" => 1, "G" => 1, "C" => 1, "T" => 1} == DnaCount.countline("AGCT")
  end

  test "rosalind example" do
    assert %{"A" => 20, "C" => 12, "G" => 17, "T" => 21} == DnaCount.countline("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
  end
end
