puts "Emptying database"
Position.destroy_all
Roster.destroy_all
Strength.destroy_all
Weakness.destroy_all
Champion.destroy_all
User.destroy_all

puts "Fetching champion data"
champion_json = HTTParty.get('http://ddragon.leagueoflegends.com/cdn/6.24.1/data/en_US/champion.json')
portrait_path = 'http://ddragon.leagueoflegends.com/cdn/6.24.1/img/champion/'

puts "Building champion database"
if champion_json['type'] == 'champion'
  champion_json['data'].each do |row|
    champ = row[1]
    c = Champion.new
    c.name = champ["name"]
    c.portrait = portrait_path + champ['id'] + '.png'
    c.save
  end
end

puts "Creating roster"
user = User.create(email: "admin@doran.com", password: "adminpass")
roster = user.create_roster
Position.create(name: "Top", roster: roster)
Position.create(name: "Jungle", roster: roster)
Position.create(name: "Mid", roster: roster)
Position.create(name: "Bottom", roster: roster)
Position.create(name: "Support", roster: roster)

puts "Seeding complete"
