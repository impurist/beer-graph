class AddObviousIndexes < ActiveRecord::Migration
  def change

    add_index :beers, :name
    add_index :beers, :description
    add_index :beers, :abv
    add_index :beers, :ibu
    add_index :beers, :srm
    add_index :beers, :upc
    add_index :beers, :brewery_id
    add_index :beers, :category_id
    add_index :beers, :style_id

    add_index :breweries, :name
    add_index :breweries, :address1
    add_index :breweries, :address2
    add_index :breweries, :city
    add_index :breweries, :state
    add_index :breweries, :code
    add_index :breweries, :country
    add_index :breweries, :phone
    add_index :breweries, :website

    add_index :categories, :name

    add_index :styles, :category_id
    add_index :styles, :name

    add_index :geocodes, :latitude
    add_index :geocodes, :longitude
    add_index :geocodes, :accuracy
    add_index :geocodes, :brewery_id

  end
end
