require 'json'

class Champion
  attr_reader :name, :roster_positions, :strengths, :weaknesses, :synergizes_with, :counters

  def initialize(obj)
    @name = obj['name']
    @roster_positions = obj['roster_positions'] || []
    @strengths = obj['strengths'] || []
    @weaknesses = obj['weaknesses'] || []
    @synergizes_with = obj['synergizes_with'] || []
    @counters = obj['counters'] || []
  end

  def self.CHAMPIONS
    @@CHAMPIONS
  end

  def self.create_from_file(path)
    file = File.read(path)
    array = JSON.parse(file)
    @@CHAMPIONS = array.map { |champ_obj| Champion.new(champ_obj) }
  end

  def self.by_name(name)
    champ_lookup = @@CHAMPIONS.select { |champ| champ.name == name }
    if champ_lookup.length == 1
      champ_lookup.first
    else
      nil
    end
  end
end

Champion.create_from_file('champ_data.json')
