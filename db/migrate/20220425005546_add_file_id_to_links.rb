class AddFileIdToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :file_id, :integer
  end
end
