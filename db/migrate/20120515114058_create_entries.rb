class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :url
      t.string :title
      t.string :email

      t.timestamps
    end
  end
end
