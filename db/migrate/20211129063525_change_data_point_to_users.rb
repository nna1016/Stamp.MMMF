class ChangeDataPointToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :point, :integer ,default: 0
  end
end
