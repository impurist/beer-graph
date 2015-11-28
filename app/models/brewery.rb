class Brewery < ActiveRecord::Base

  has_many :beers
  has_many :categories
  has_one :geocode

end
