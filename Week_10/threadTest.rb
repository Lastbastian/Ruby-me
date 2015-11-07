threads = []

10.times do
  thread = Thread.new do
    10.times { |i| print i; $stdout.flush; sleep rand(2) }
  end

  threads << thread
end
puts threads.inspect
puts threads.each { |thread| thread.join }