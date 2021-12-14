class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :temp_file
      t.references :accounts
      t.boolean :active
      t.timestamps
    end
  end
end
