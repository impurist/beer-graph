class CreateGeocodes < ActiveRecord::Migration
  def change
    create_table :geocodes do |t|
      t.integer :brewery_id
      t.decimal :latitude, {:precision=>19, :scale=>15}
      t.decimal :longitude, {:precision=>19, :scale=>15}
      t.string :accuracy
      t.timestamps null: false
    end
  end
end
