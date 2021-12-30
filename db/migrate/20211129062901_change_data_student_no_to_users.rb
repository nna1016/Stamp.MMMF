class ChangeDataStudentNoToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :student_no, :string
  end
end
