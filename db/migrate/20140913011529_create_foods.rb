class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :shelf_life

      t.timestamps
    end
  end
end
