class AddColumnTyusens < ActiveRecord::Migration[6.1]
  def change
    add_column :tyusens, :check, :string, after: :prize
  end
end
