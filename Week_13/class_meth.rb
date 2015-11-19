class ClassMethod
  # This is an object method
  def obj_method
    "To run me,  you need to create an instance."
  end

  # This is a class method
  def self.klass_method
    puts "I'm a class method. You can run me without creating an instance."
    self.methods.sort
  end
end

print ClassMethod::klass_method