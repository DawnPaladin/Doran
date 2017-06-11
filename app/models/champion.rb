class Champion < ApplicationRecord
  has_one :roster
  has_many :strengths
  has_many :weaknesses
  has_many :synergies
  has_many :counters
end
