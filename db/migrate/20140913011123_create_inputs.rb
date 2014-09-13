class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.integer :food_id
      t.integer :user_id
      t.date :date
      t.string :name
      t.integer :quality
      t.date :exp_date
      t.integer :num_days

      t.timestamps
    end
  end
end
