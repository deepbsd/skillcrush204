#!/usr/bin/ruby

def reverse_letters(word)
    if word.kind_of?(Array) and word.length == 2
        new_word = word[1]+word[0]
	new_word = new_word.split('')
    else
        puts "Error: Array of two letters only, please."
    end
    new_word
end


