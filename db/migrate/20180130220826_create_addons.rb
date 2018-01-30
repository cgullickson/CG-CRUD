class CreateAddons < ActiveRecord::Migration
  def change
    create_table :addons do |t|
      t.string :name
      t.string :kind
      t.integer :snowboard_id
    end
  end
end
