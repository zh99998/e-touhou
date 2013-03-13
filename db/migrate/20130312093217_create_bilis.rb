class CreateBilis < ActiveRecord::Migration
  def change
    create_table :bilis do |t|
      t.references :page
      t.references :user
      t.text :content
      t.integer :x
      t.integer :y

      t.timestamps
    end
    add_index :bilis, :page_id
    add_index :bilis, :user_id
  end
end
