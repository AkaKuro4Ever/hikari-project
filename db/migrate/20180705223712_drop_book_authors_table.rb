class DropBookAuthorsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :book_authors
  end
end
