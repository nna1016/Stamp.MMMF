class AddColumnToProblems < ActiveRecord::Migration[6.1]
  def change
    add_column :problems, :hint, :string, after: :answer
    add_column :problems, :commentary, :string, after: :hint
  end
end
