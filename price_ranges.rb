class Customer
  attr_reader :name, :floor, :ceiling

  def initialize(args)
    @name = args[:name]
    @floor = args[:floor]
    @ceiling = args[:ceiling]
  end

  def which_companies(*companies)
    companies.each do |company| 
      puts "You can shop at #{company.name}!" if company.in_range?(self.floor, self.ceiling)
    end
  end    
end

class Company < Customer

  def in_range?(low, high)
    (floor..ceiling).include?(low) || (floor..ceiling).include?(high)
  end
end

company_a = Company.new({name: "Medium Porridge", floor: 1_000, ceiling: 3_000})
company_b = Company.new({name: "Ritzy Ritz", floor: 6_000, ceiling: 10_000})
company_c = Company.new({name: "Poor House", floor: 500, ceiling: 2_500})
customer = Customer.new({name: "Troy Barnes", floor: 2_000, ceiling: 2_999})
customer.which_companies(company_a, company_b, company_c)