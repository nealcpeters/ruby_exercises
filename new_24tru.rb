input = File.open('sample.txt')
output = File.new('sample_wacky.txt', 'w')

input.each_line do |line|
  words = line.split(" ")
  words.each do |word|
    suffix = Array.new
    if word[0] =~ /[aeiou]/
      output.write((word << "meh" + " "))
    else
      word.each_char do |letter|
        break if letter =~ /[aeiou]/        
        suffix << letter
      end
      output.write((word[suffix.length..-1] << suffix.join("") << "ing" + " "))
    end
  end
end