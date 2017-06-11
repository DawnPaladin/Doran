class Position < ApplicationRecord
  belongs_to :roster
  has_many :champions
end
