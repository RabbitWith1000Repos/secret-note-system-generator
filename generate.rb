#!/usr/bin/env ruby

# basic: scramble 26 letters so that none are the same

LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

@scrambled_letters = ""

def is_scrambled?
  @scrambled_letters.split(//).each_with_index do |letter, index|
    return false if letter == LETTERS[index]
  end

  true
end

done = false

while !done
  @scrambled_letters = LETTERS.split(//).shuffle.join

  done = is_scrambled?
end

@scrambled_letters.split(//).each_with_index do |letter, index|
  puts "#{LETTERS[index]} - #{letter}"
end

# advanced: add symbols that mean common letters that also modify
# the prior letter
#
# order based on http://pi.math.cornell.edu/~mec/2003-2004/cryptography/subs/frequencies.html

COMMON_LETTERS = "ETAOINSRH"
SYMBOLS =        "!@#$%&*+="

adjustments = COMMON_LETTERS.split(//).shuffle.each_with_index.each_with_object({}) do |(letter, index), obj|
  obj[SYMBOLS[index]] = { letter: letter, prior_adjustment: rand(7)-3 }
end

pp adjustments
