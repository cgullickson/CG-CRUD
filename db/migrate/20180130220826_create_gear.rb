class CreateGear < ActiveRecord::Migration
  def change
    create_table :gear do |t|
      t.string :name
      t.string :type
      t.integer :project_id
    end
  end
end
