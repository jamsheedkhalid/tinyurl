class ChangeLinks < ActiveRecord::Migration[7.0]
  def change
    change_column :links, :url, :text
  end
end
