class CreatePrizes < ActiveRecord::Migration[6.1]
  def change
    create_table :prizes do |t|
      t.string :student_no
      t.string :prize

      t.timestamps
    end
    add_index :prizes, :student_no, unique: true
  end
end
