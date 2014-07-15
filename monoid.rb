
class Monoid
	#monoid_empty, monoid_append
	attr_reader :mempty, :mappend
	def initialize(mempty, mappend)
      @mempty = mempty
      @mappend = mappend
    end
    #Monoid rules
    #mappend(a,mempty) == a
    #mappend(mempty,a) == a
    #mappend(a,mappend(b,c)) == mappend(mappend(a,b),c)
end

add = ->(a,b){a+b}
addition = Monoid.new(0,add)
p [1,2,3,4].reduce(addition.mempty, &addition.mappend)

mult = ->(a,b){a*b}
multiplication = Monoid.new(1,mult)
p [1,2,3,4].reduce(multiplication.mempty, &multiplication.mappend)
