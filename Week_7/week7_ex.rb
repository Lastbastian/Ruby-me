class Student
  @@count = 0
  attr_accessor :user_name, :password, :uid, :gid, :gcos_field, :home_directory, :shell

  def initialize(user_name, password, uid, gid, gcos_field, home_directory, shell)
    @user_name = user_name
    @password = password
    @uid = uid
    @gid = gid
    @gcos_field = gcos_field
    @home_directory = home_directory
    @shell = shell
  end

  def counter
    @@count += 1
  end
end

class String

  def alternate_case
    count = 0
    out = ''
    self.scan(/./m) do |b|
      if count == 0
        out << b.upcase && count = 1
      else
        out << b.downcase && count = 0
      end
    end
    out
  end

  def ucwords
    self.split.map(&:capitalize).join(' ')
  end

end

t = Time.now
start = t.to_f

class_usernames = ""
all_user_attr = []
class_user_attr = []

# use "group" for local
File.open("group", "r") do |f|
  f.each_line do |line|
    class_usernames = line if line.include?("c73157")
  end
end

class_username_array = class_usernames[15..-1].split(',')

# use "passwd" for local
File.open("passwd", "r") do |f|
  f.each_line do |line|
    all_user_attr << line.delete("\n")
  end
end

# creates an array of strings with only our members from our class
class_username_array.each do |name|
  all_user_attr.each do |line|
    class_user_attr << line if line.include?(name)
  end
end

# creates an array of arrays
class_user_attr.map! do |line|
 line.split(':')
end

# creates instance of each student, increments counter, prints output
index = 1
class_user_attr.each do |line|
  student = line[0] + index.to_s
  student = Student.new(line[0], line[1], line[2], line[3], line[4], line[5], line[6])
  student.counter

  printf("%3d %12s %3s %8s %8s %15s %25s %15s \n", index, "#{student.user_name}", "#{student.password}", "#{student.uid}", "#{student.gid}", "#{student.gcos_field.alternate_case}", "#{student.home_directory}", "#{student.shell}")
  index += 1
end

finish = Time.now
print 'Elapsed time: ' + (finish.to_f - start.to_f).to_s