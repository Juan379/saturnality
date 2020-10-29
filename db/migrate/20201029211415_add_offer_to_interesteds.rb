class AddOfferToInteresteds < ActiveRecord::Migration[5.2]
  def change
    add_column :interesteds, :offer, :string
  end
end
