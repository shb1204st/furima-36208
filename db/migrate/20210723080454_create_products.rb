class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :product_name,       null: false
      t.text       :product_explain,    null: false
      t.integer    :category_id,        null: false
      t.integer    :product_status_id,  null: false
      t.integer    :cost_id,            null: false
      t.integer    :seller_place_id,    null: false
      t.integer    :need_days_id,       null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
