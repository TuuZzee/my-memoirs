class CreateMemoirs < ActiveRecord::Migration
  def change
    create_table :memoirs do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :memoirs, [:user_id, :created_at]
  end
end
