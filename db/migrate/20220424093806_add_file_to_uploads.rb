class AddFileToUploads < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :file, :string
  end
end
