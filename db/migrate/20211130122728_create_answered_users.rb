class CreateAnsweredUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :answered_users do |t|
      t.string :student_no
      t.string :answered_quest

      t.timestamps
    end
  end
end
