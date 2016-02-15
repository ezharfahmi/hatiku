class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :npenceramah
      t.string :tajuk
      t.string :kitab
      t.date :tarikh
      t.string :location

      t.timestamps null: false
    end
  end
end
