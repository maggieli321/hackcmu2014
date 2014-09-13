<<<<<<< HEAD
class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.integer :food_id
      t.integer :user_id
      t.date :date
      t.string :name
      t.string :quality
      t.date :exp_date
      t.integer :num_days

      t.timestamps
    end
  end
end
=======
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
>>>>>>> 635a85998a33922da85a16751810f34d6d92ec81
