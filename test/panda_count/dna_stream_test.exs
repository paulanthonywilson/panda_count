defmodule PandaCount.DnaStreamTest do
  use ExUnit.Case

  alias PandaCount.DnaStream

  test "count rosalind" do
    assert %{"A" => 20, "C" => 12, "G" => 17, "T" => 21} == DnaStream.countbases(["AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"])
  end

  test "ignore sequence headers" do
    assert %{"A" => 20, "C" => 12, "G" => 17, "T" => 21} == DnaStream.countbases([
      ">GL192338.1",
      "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"]
    )
  end

  test "a bit of a giant panda" do
    assert %{"A" => 2961, "C" => 3349, "G" => 3228, "N" => 70, "T" => 3087, "a" => 2997, "c" => 2840, "g" => 2824, "t" => 3594} ==
      DnaStream.countbases(File.stream!("test/testy.fa"))
  end
end
