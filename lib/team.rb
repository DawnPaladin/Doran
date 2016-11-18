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
end
