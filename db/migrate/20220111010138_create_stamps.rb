class CreateStamps < ActiveRecord::Migration[6.1]
  def change
    create_table :stamps do |t|
      t.string :name
      t.string :stamp_id
      t.string :image

      t.timestamps
    end
  end
end
