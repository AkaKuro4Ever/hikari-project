class CreateBookReaders < ActiveRecord::Migration[5.2]
  def change
    create_table :book_readers do |t|
      t.integer :book_id
      t.integer :user_id
    end
  end
end
