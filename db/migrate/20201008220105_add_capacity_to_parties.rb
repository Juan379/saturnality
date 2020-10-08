class AddCapacityToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :capacity, :integer
  end
end
