class AddStyleToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :style, :string
  end
end
