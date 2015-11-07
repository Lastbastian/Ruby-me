class MyClass
  def method_missing(method_id, *args)
    self.instance_eval
      "def #{method_id}(*args)
        puts "Creating #{method_id} method."
        args.each {|a| p a.inspect }
      end"
    self.send method_id, args
  end
end

m = MyClass.new
m.user_name = 'Steve'
puts m.user_name