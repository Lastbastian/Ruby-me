require 'net/http'

pages = %w( www.ccsf.edu norbert.ccsf.edu hills.ccsf.edu )

threads = []

for page_to_fetch in pages
  threads << Thread.new(page_to_fetch) do |url|
    h = Net::HTTP.new(url, 80)
    puts "Fetching : #{url}"
    resp = h.get('/', nil)
    out = File.open(url + ".html", "w")
    out.puts(resp)
    out.close
    puts "Got #{url} "
  end
end
threads.each { |th| th.join }