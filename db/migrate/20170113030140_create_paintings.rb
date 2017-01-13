class CreatePaintings < ActiveRecord::Migration[5.0]
  def change
    create_table :paintings do |t|
      t.string :title, null: false
      t.string :year, null: false
      t.string :artist, null: false
      t.belongs_to :gallery, null: false

      t.timestamps
    end
  end
end
