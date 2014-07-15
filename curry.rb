#currying

foo = proc {|x,y,z|
	p [x, y , z]
	print "\n"
  }

foo.call("1","2","3")

foo1 = foo.curry.("One")
foo1.call("2","3")


foo2 = foo.curry.("One","Two")
foo2.call("3")


bar = lambda {|a, b| 
			p [ a, b] }
bar.call("1","2")

bar1 = bar.curry["One"]
bar1.call("2")
