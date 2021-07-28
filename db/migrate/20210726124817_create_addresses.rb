class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,       null: false
      t.integer    :seller_place_id, null: false
      t.string     :city,            null: false
      t.string     :address,         null: false
      t.string     :build_name
      t.string     :phone_num,       null:false
      t.references :buy,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
