class Word

    def self.find_anagrams(word)
        anagram_array = word.split('').permutation.to_a.map{|w| w.join}
        return anagram_array
   end

end

