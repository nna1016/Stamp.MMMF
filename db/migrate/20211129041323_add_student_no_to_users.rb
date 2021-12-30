class AddStudentNoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :student_no, :integer
    add_column :users, :name, :string
    add_column :users, :point, :string
    add_column :users, :role_flag, :string
  end
end
