class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :category
      t.string :isbn
      t.string :image_url
      t.string :book_url
      t.integer :year
      t.integer :pages
      t.text :description
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
