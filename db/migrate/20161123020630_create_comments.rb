class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :episode_id
      t.text :body
      t.references :member, foreign_key: true

      t.timestamps
    end
    add_index :comments, :episode_id
  end
end
