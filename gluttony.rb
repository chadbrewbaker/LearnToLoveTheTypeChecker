#Find max < "eb693ec8252cd630102fd0d0fb7c3485" 
#Show how using O(1) intermediate storage improves performance

require 'securerandom'
require 'benchmark'
keys = []
1.upto 10000000 do |index|
 keys.push(SecureRandom.hex)
end
checks = []
Benchmark.bm(15) do |x|
  x.report("Sort:")  { checks.push keys.find_all { |k| 
  	k< "eb693ec8252cd630102fd0d0fb7c3485" }.sort()[-1]  }
  x.report("Max:")   { checks.push  keys.find_all { |k| 
  	k< "eb693ec8252cd630102fd0d0fb7c3485" }.max  }
  x.report("takewhile:") {checks.push keys.select{|k| 
  	k< "eb693ec8252cd630102fd0d0fb7c3485"}.take_while{|i| i}.max } 
  x.report("inject") {checks.push  keys.inject(nil) { | result, element| 
				if(element < "eb693ec8252cd630102fd0d0fb7c3485" )
					if(result.nil?)
						result = element
					else
						if( result < element)
							result = element
						end
						result
					end
				else
					result
				end
		} 
	}
  x.report("Lazy")   { checks.push  keys.lazy.select{|k| 
  	k< "eb693ec8252cd630102fd0d0fb7c3485"}.lazy.take_while{|i| i}.lazy.max }
  x.report("Lazy 2")   { checks.push  keys.select{|k| 
  	k< "eb693ec8252cd630102fd0d0fb7c3485"}.lazy.take_while{|i| i}.lazy.max }
  x.report("Lazy 3")   { checks.push  keys.lazy.select{|k| 
	k< "eb693ec8252cd630102fd0d0fb7c3485"}.take_while{|i| i}.lazy.max }
  x.report("Lazy 4")   { checks.push  keys.lazy.select{|k| 
  	k< "eb693ec8252cd630102fd0d0fb7c3485"}.lazy.take_while{|i| i}.max }  
end
puts "Unique values" + checks.uniq.to_s

