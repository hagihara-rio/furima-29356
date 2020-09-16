class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :itemname,          null:false, limit: 40
      t.text       :detail,            null:false, limit: 1000
      t.integer    :category_id,       null:false
      t.integer    :condition_id,      null:false
      t.integer    :shipping_fee_id,   null:false

      t.integer    :shipping_area_id,  null:false
       
      t.integer    :shipping_days_id,  null:false
      t.integer    :price,             null:false, limit: 7
      t.references :user,              null:false

      t.timestamps

    end
  end
end

