require 'json'
require 'pathname'

class Champion
  attr_reader :name, :roster_positions, :strengths, :weaknesses, :synergizes_with, :counters, :countered_by, :icon

  def initialize(obj)
    @name = obj['name']
    @roster_positions = obj['roster_positions'] || []
    @strengths = obj['strengths'] || []
    @weaknesses = obj['weaknesses'] || []
    @synergizes_with = obj['synergizes_with'] || []
    @counters = obj['counters'] || []
    @countered_by = []
    @icon = "champion-squares/#{@name}_Square_0.png"
  end

  def my_counters
    list = []
    @@CHAMPIONS.each do |champ|
      list << champ.name if champ.counters.include?(@name)
    end
    list
  end

  def populate_countered_by
    @countered_by = my_counters
  end

  def self.CHAMPIONS
    @@CHAMPIONS
  end

  def self.create_from_file(path)
    file = File.read(path)
    array = JSON.parse(file)
    @@CHAMPIONS = array.map { |champ_obj| Champion.new(champ_obj) }
    @@CHAMPIONS.each { |champ| champ.populate_countered_by }
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
