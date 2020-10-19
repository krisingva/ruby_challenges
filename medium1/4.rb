# Protein Translation
# Lets write a program that will translate RNA sequences into proteins. RNA can
# be broken into three nucleotide sequences called codons, and then translated
# to a polypeptide like so:

# RNA: "AUGUUUUCU" => translates to

# Codons: "AUG", "UUU", "UCU"
# => which become a polypeptide with the following sequence =>

# Protein: "Methionine", "Phenylalanine", "Serine"
# There are 64 codons which in turn correspond to 20 amino acids; however, all
# of the codon sequences and resulting amino acids are not important in this
# exercise.

# There are also four terminating codons (also known as 'STOP' codons); if any
# of these codons are encountered (by the ribosome), all translation ends and
# the protein is terminated. All subsequent codons after are ignored, like this:

# RNA: "AUGUUUUCUUAAAUG" =>

# Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

# Protein: "Methionine", "Phenylalanine", "Serine"
# Note the stop codon terminates the translation and the final methionine is not
# translated into the protein sequence.--

# Below are the codons and resulting Amino Acids needed for the exercise.

# Codon	Amino Acids
# AUG	Methionine
# UUU, UUC	Phenylalanine
# UUA, UUG	Leucine
# UCU, UCC, UCA, UCG	Serine
# UAU, UAC	Tyrosine
# UGU, UGC	Cysteine
# UGG	Tryptophan
# UAA, UAG, UGA	STOP

# My notes:
# -Translation class
# -class methods:
#   -::of_codon(codon)
# -uses lookup table to return the amino acid that matches the codon passed in
# as a string
#   -if the codon passed in is not found in the lookup table
#     -raise InvalidCodonError
#   -::of_rna(strand)
# -passes each codon from strand to ::codon method and returns an array of
# strings

# data:
# -lookup table is a hash
#   -keys are arrays of codons
#   -values are amino acid

class Translation
  AMINO_ACIDS = {
    %w(AUG) => "Methionine",
    %w(UUU UUC) => "Phenylalanine",
    %w(UUA UUG) => "Leucine",
    %w(UCU UCC UCA UCG) => "Serine",
    %w(UAU UAC) => "Tyrosine",
    %w(UGU UGC) => "Cysteine",
    %w(UGG) => "Tryptophan",
    %w(UAA UAG UGA) => "STOP"
  }.freeze

  def self.of_codon(codon)
    raise InvalidCodonError unless valid_codon?(codon)

    AMINO_ACIDS.select do |codons, _|
      codons.include?(codon)
    end.values.first
  end

  def self.valid_codon?(codon)
    AMINO_ACIDS.keys.any? do |subarr|
      subarr.include?(codon)
    end
  end

  def self.of_rna(strand)
    strand.scan(/.../).each_with_object([]) do |codon, arr|
      return arr if of_codon(codon) == 'STOP'
      arr << of_codon(codon)
    end
  end
end

class InvalidCodonError < StandardError
end

# p Translation.of_codon('AUG')
