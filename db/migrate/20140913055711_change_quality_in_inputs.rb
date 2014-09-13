class ChangeQualityInInputs < ActiveRecord::Migration
  def change
  	change_column :inputs, :quality, :string
  end
end
