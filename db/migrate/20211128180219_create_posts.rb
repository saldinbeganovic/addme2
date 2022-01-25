class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :image
      t.references :account
      t.boolean :active
      t.timestamps
    end
  end
end
