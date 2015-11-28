class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :brewery_id
      t.integer :category_id
      t.integer :style_id
      t.string :abv
      t.string :ibu
      t.string :srm
      t.string :upc
      t.string :filepath
      t.string :description
      t.timestamps null: false
    end
  end
end
