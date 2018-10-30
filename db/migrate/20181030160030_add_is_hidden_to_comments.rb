class AddIsHiddenToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :hidden, :boolean, default: false
    add_column :comments, :needs_review, :boolean, default: false
  end
end
