class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :title
      t.text :body
      t.integer :parent_id
      t.text :parent_type

      t.timestamps
    end
  end
end
