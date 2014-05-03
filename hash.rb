class HashMap
  attr_accessor :container, :default

  def initialize
    @container = []
  end

  def set_default(value = nil)
    @default = value
  end

  def add(key, value = nil)
    if value != nil
      @container << [key, value]
    else
      @container << [key, @default]
    end
  end

  def keys
    @container.each do |bucket|
      puts bucket[0]
    end
  end

  def values
    @container.each do |bucket|
      puts bucket[1]
    end
  end

  def access(key)
    @container.each do |bucket|
      bucket.each_with_index do |subject, index|
        if index == 0 && key == subject
          puts bucket[1]
        end
      end
    end
  end
end

bob = HashMap.new
bob.add(:ruby, "best programming language")
puts bob.container
puts "----------------"
bob.set_default("cat")
bob.add(:atlas)
puts bob.container
puts "----------------"
bob.access(:ruby)
bob.access(:atlas)
puts "----------------"
bob.keys
puts "----------------"
bob.values