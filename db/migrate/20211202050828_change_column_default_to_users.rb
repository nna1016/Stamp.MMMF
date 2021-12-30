class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :role_flag, from: nil, to: "1"
  end
end
