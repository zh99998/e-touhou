class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :comic
      t.string :user
      t.text :content

      t.timestamps
    end
    add_index :comments, :comic_id
  end
end
