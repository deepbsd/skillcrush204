require 'spec_helper'

describe 'Our Anagrams App' do
  include SpecHelper
  
  it 'adds letters before a new word is created' do
    word = Word.create(text: "heroku")
    expect(word.reload.letters == "ehkoru").to be(true)
  end
  
end