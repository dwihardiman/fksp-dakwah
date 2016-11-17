class AddAttributesToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :title, :string
    add_column :members, :description, :text
    add_column :members, :facebook, :string
    add_column :members, :instagram, :string
  end
end
