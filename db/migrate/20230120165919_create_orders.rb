class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :description, null: false
      t.string :status, null: false, default: 'pending'

      t.timestamps
    end
  end
end
