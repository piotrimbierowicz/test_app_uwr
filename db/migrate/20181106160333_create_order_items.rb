class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :course_edition_id
      t.monetize :price

      t.timestamps
    end
  end
end
