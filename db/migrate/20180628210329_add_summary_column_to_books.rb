class AddSummaryColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :summary, :text
  end
end
