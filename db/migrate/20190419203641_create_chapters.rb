class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.integer :book_id
      t.text :content

      t.timestamps
    end
  end
end
