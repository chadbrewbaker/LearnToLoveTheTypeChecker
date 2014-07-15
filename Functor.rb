
#(a->b) -> (fa -> fb)
def fmap(f , g )
	-> (a){ g.call( f.call(a) )  }
end
f = ->(a){ a.upcase  }
g = ->(a){"_"+a}
h = ->(a){a.reverse}
p f.call("uppercase_me") #"UPPERCASE_ME"
p g.call("prefix_underscore")  #"_prefix_underscore"
p h.call("reverse")  #"esrever"
p fmap(f,g).call("foo")  #"_FOO"
p fmap(g,h).call("foo")  #"oof_"
p fmap(h,h).call("foo")  #"foo"
p fmap(fmap(h,h),h).call("foo") #"oof"