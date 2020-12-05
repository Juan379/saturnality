class AddStatusToAttendees < ActiveRecord::Migration[5.2]
  def change
    add_column :attendees, :status, :string, default: "pending"
  end
end
