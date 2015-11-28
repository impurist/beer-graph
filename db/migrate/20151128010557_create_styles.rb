class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.integer :category_id
      t.timestamps null: false
    end
  end
end
