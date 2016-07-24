class CreateApologizes < ActiveRecord::Migration
  def change
    create_table :apologizes do |t|
      t.string :apologize_image
      t.string :description
      t.integer :author_id

      t.timestamps null: false
    end
    add_index :apologizes, :author_id
  end
end
