class RemoveUserIdFromAttendances < ActiveRecord::Migration[6.1]
  def change
    remove_reference :attendances, :user, foreign_key: true
  end
end
