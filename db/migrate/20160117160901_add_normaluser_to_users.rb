class AddNormaluserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :date
    add_column :users, :country, :string
  end
end
