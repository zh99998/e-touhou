class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :comic
      t.references :user

      t.timestamps
    end
    add_index :pages, :comic_id
    add_index :pages, :user_id
  end
end
