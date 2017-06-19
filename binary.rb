require 'colorize'
require 'pry'
require 'rb-readline'
phrase_in = ""
charclump = ""

def clear_screen
  Gem.win_platform? ? (system "cls") : (system "clear")
end


def print_vars(phrasedisp, clumpsizedisp)
  puts "String is:".blue + " " + phrasedisp + "\n"
  puts "Charclump:".blue + " " + clumpsizedisp + "\n"
  puts "---------------------------------------------\n\n"
end

clear_screen
print_vars(phrase_in, charclump)

puts "Please enter the phrase you'd like to convert."
while phrase_in == "" do
  phrase_in = gets.chomp
  if phrase_in == ""
    puts "PHRASE CANNOT BE EMPTY".red
  end
end

clear_screen
print_vars(phrase_in, charclump)

puts "Please enter the size of each binary chunk (def: 8): "
while charclump == "" do
  charclump = gets.chomp
  if charclump == ""
    charclump = "8"
  else
    puts "PLEASE ENTER SIZE (numbers only)!".red
  end
end 
numclump = charclump.to_i

clear_screen
print_vars(phrase_in, charclump)

puts "here goes code for making string for output"
puts "here goes code for scanning input by char and outputting binary"

output_prespace = "0110111100100000011010000110000101101001" #DEBUG
output_postspace = output_prespace.scan(/.{1,#{numclump}}/).join(' ')
binding.pry
puts "raw: #{output_prespace}"
puts "fmt: #{output_postspace}"
