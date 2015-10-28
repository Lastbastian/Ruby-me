escargot_player_data = [
  ['Jim','bullfrog',99],
  ['Mack the Knife','caterpillar',12],
  ['Willy','chihuahua',143],
  ['Trudy','bunny',3],
  ['Mary Lou','slow loris',1443],
  ['Sharon Stone','komodo dragon',8888],
]

table = '<table>' + "\n"
table += "<tr><th>Name</th><th>Mascot</th><tr>Strength</tr><tr>" + "\n"

escargot_player_data.each do |player|
  table += "<tr><td>#{player[0]}</td><td>#{player[1]}</td><td>#{player[2]}</td></tr>" + "\n"
end

table += '</table>' + "\n"

puts table