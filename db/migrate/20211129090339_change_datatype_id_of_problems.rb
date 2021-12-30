class ChangeDatatypeIdOfProblems < ActiveRecord::Migration[6.1]
  def change
    change_column :problems, :id, :string
  end
end
