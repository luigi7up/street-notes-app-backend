class AddBase64FieldToImage < ActiveRecord::Migration
  def change
    add_column :images, :base64, :text
  end
end
