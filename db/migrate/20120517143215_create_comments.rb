class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :email
      t.references :entry

      t.timestamps
    end
    add_index :comments, :entry_id
  end
end
