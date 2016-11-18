require_relative 'champion'

class Team
  attr_reader :roster
  def initialize
    @roster = []
  end
  def add_by_name(name)
    raise ArgumentError unless name.is_a?(String)
    @roster << Champion.by_name(name)
  end
  def strengths
    hash = {}
    @roster.each do |teammate|
      teammate.strengths.each do |strength|
        if hash.key?(strength)
          hash[strength] += 1
        else
          hash[strength] = 1
        end
      end
    end
    hash
  end
end
