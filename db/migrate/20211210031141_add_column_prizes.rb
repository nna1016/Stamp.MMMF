class AddColumnPrizes < ActiveRecord::Migration[6.1]
  def change
    add_column :prizes, :reg_user, :string, after: :prize
  end
end
