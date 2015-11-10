code = {}
code[:NameError] = <<END
# Name Error
asdfasdf
END

code[:ArgumentError] = <<END
# ArgumentError
range(0..'100')
END

code[:NoMathodError] = <<END
class MyClass
  def runner(a,b)
    puts a + b
  end
end
myc = MyClass.new
#NoMethodError
myc.thisandthat
END

code[:IndexError] = <<END
# IndexError
ex = { :a => 'A', :b => 'B' }
ex.fetch(:z)
END

code[:ZeroDivisionError] = <<END
1/0
END

code.each do |k, v|
  puts k.to_s + v
end

code.each do |key, code|
  begin
    eval code
  rescue Exception => e
    puts '<div class="data">'
    print "<h1>#{key.to_s}</h1>"
    puts e.message
    puts '<div class="backtrace">Stack Trace:<br /> '
    puts e.backtrace.join("<br />\n")
    puts '</div>'
    puts '</div>'

  end
end