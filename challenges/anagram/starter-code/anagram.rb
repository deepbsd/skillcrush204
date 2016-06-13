#!/usr/bin/ruby


def find_anagram(word)
    word_length = 3
    if word.kind_of?(String) and word.length <= word_length
        anagram_array = word.split('').permutation.to_a.map{|w| w.join}
	return anagram_array
    else
        puts "Error: String must be not greater than #{word_length}"
    end
end

=begin
words = ["one", "two", "four", "five", "three", "abc"]
words.each do |word|
    array = find_anagram(word)
    array.each {|w| print w+' '}
end
=end
