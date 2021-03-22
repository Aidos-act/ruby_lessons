class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :price
      t.string :publish
      t.date :published
      t.string :genre
    end
  end
end
