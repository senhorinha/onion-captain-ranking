class Match < ActiveRecord::Base
  validates :player, presence: true
  validates :score, numericality: { greater_than_or_equal_to: 0 }
end
