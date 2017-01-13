class Painting < ApplicationRecord
  belongs_to :gallery

  validates :title, presence: true
  validates :artist, presence: true
  validates :year, presence: true
end
