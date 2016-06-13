#!/usr/bin/ruby

require_relative 'reverse_letters'

def find_anagram(word)
    if word.kind_of?(String) and word.length == 3
        anagram_array = Array.new()
        new_array = word.split('').permutation.to_a
	new_array.each do |str|
	    anagram_array << str.join()
	end
	return anagram_array
    else
        puts "String of exactly 3 letters, please."
    end
end

=begin
words = ["one", "two", "the"]

words.each do |w|
    puts find_anagram(w)
end
=end
