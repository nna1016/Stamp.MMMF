class AddColumnFriends < ActiveRecord::Migration[6.1]
  def change
    add_column :friends, :friend_student_no, :string, after: :student_no
  end
end
