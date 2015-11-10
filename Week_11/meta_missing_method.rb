class MyAwesomeClass
  def method_missing(method_id, *args)
    # Create the missing method using instance_eval
    self.instance_eval "def #{method_id}(*args)
      print \"Hey, I'm creating a new method named #{method_id} and it has these arguments: \"
      args.each { |a| p a.inspect }
    end"
    # Then call the newly created method one time, when the missing method is created.
    self.send method_id, args
  end
end

m = MyAwesomeClass.new
m.hello.goodbye.talk 'Joe' 'Art' 'Mary'

