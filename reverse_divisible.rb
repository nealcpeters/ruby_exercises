@upper_bound = (( ARGV[0].to_i == 0 ) ? 1_000_000 : ARGV[0].to_i)

class Integer
  def reverse
    self.to_s.reverse.to_i
  end

  def ends_in_zero?
    self % 10 == 0
  end
end

def tally
  @upper_bound.downto(0) do |i|
    next if i.ends_in_zero?
    next if i == i.reverse
    puts i if i % i.reverse == 0
  end
end

tally