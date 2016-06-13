require 'rspec'
require_relative '../anagram.rb'

describe "#find_anagram" do
  let(:word) { "abc" }

  it "takes a string" do
    expect {
      find_anagram(word)
    }.not_to raise_error
  end

  it "returns an array" do
    expect(find_anagram(word)).to be_a(Array)
  end

  it "returns the correct results" do
    expect(find_anagram(word)).to match_array(
      %w(abc acb bac bca cab cba)
    )
  end
end
