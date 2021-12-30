class CreateSiteInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :site_infos do |t|
      t.string :ip_add
      t.timestamps
    end
  end
end
