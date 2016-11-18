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
  def strengths
    hash = Hash.new(0)
    @roster.each do |teammate|
      teammate.strengths.each do |strength|
        hash[strength] += 1
      end
    end
    hash
  end
end
