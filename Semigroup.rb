class Semigroup	
	attr_reader :append
	def initialize(append)
      @append = append
    end
    #Semigroup rule
    #append(a,append(b,c)) == append(append(a,b),c)
end

add = ->(a,b){a+b}
addition = Semigroup.new(add)
p [1,2,3,4].reduce(&addition.append)

mult = ->(a,b){a*b}
multiplication = Semigroup.new(mult)
p [1,2,3,4].reduce(&multiplication.append)