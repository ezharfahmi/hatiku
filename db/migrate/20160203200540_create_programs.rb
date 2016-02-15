class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :npenceramah
      t.string :tajuk
      t.string :kitab
      t.date :tarikh
      t.string :location
      t.time :start_time
      t.time :end_time
      t.string :description
      t.string :type
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
