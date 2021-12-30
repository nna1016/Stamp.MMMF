class CreateProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :problems do |t|
      t.string :problem_statement
      t.string :select_1
      t.string :select_2
      t.string :select_3
      t.string :select_4
      t.string :answer
      t.integer :point
      t.string :place
      t.string :problem_code

      t.timestamps
    end
  end
end
