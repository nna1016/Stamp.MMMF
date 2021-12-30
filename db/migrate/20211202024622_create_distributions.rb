class CreateDistributions < ActiveRecord::Migration[6.1]
  def change
    create_table :distributions, id: :string do |t|
      t.string :student_no, default: "0"

      t.timestamps
    end
  end
end
