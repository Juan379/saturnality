class AddStatusToAttendees < ActiveRecord::Migration[5.2]
  def change
    add_column :attendees, :status, :boolean
  end
end
