require_relative 'champion'

class Team
  attr_reader :roster, :name, :descriptor
  def initialize(name, descriptor)
    @roster = []
    @name = name
    @descriptor = descriptor
  end
  def add_by_name(name)
    raise ArgumentError unless name.is_a?(String)
    champ = Champion.by_name(name)
    @roster << champ unless champ.nil?
  end
  def remove_by_name(name)
    raise ArgumentError unless name.is_a?(String)
    champ = Champion.by_name(name)
    p @roster
    @roster = @roster - champ
    p @roster
  end
  def remove_by_index(index)
    @roster.delete_at(index.to_i)
  end
  def attribute(atts)
    # takes a symbol like :strengths
    # returns a hash enumerating the team's :strengths
    hash = Hash.new(0)
    @roster.each do |teammate|
      teammate.send(atts).each do |att|
        hash[att] += 1
      end
    end
    hash
  end
  def balance
    strengths = attribute(:strengths)
    weaknesses = attribute(:weaknesses)
    keys = strengths.keys + weaknesses.keys
    hash = Hash.new(0)
    keys.each do |key|
      hash[key] = strengths[key] - weaknesses[key]
    end
    hash
  end
end
