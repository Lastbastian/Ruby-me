parent_to_child_in, parent_to_child_out = IO.pipe
child_to_parent_in, child_to_parent_out = IO.pipe

fork do
  #child code
  parent_to_child_out.close
  child_to_parent_in.close

  child_to_parent_out.puts 'Hi Mom'
  count = 1
  while( count < 50 )
    reply = parent_to_child_in.gets.chomp
    puts "\tI have #{count} messages from Mom: #{reply.upcase}"
    child_to_parent_out.puts "\t" + "Hi Mom. What did you say?"
    count += 1
  end
  child_to_parent_out.puts "\t" + "I give up!!!"
end

child_to_parent_out.close
parent_to_child_in.close

while( reply = child_to_parent_in.gets)
  puts "My child says #{reply}"
  parent_to_child_out.puts "Please speak up.  I cannot hear you!!!"
end

puts "My child's id is " + Process.wait.to_s