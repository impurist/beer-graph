class Brewery < ActiveRecord::Base

  has_many :beers
  has_many :categories
  has_one :geocode

  has_many :styles, through: :beers


end
