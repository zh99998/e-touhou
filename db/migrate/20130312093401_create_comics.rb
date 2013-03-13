class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :name
      t.references :user
      t.boolean :finished
      t.string :artist
      t.references :category
      t.string :translator
      t.string :publish
      t.boolean :x_rated
      t.boolean :under_review

      t.timestamps
    end
    add_index :comics, :user_id
    add_index :comics, :category_id
  end
end
