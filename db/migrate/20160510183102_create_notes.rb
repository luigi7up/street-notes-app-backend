class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :description
      t.float :lat
      t.float :long
      t.timestamps
      t.references :user, index: true , foreign_key: true
    end
  end
end
