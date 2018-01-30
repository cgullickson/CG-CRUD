class CreateSnowboards < ActiveRecord::Migration
  def change
    create_table :snowboards do |t|
      t.string :name
      t.string :brand
      t.integer :user_id
    end
  end
end
