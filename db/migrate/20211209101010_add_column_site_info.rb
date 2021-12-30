class AddColumnSiteInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :site_infos,:student_no, :string, after: :id
    add_column :site_infos,:path, :string, after: :id
  end
end
