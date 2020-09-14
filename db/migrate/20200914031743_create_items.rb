class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string     :itemname,       null:false, limit: 40
      t.text       :detail,         null:false, limit: 1000
      t.integer    :category,       null:false
      t.integer    :condition,      null:false
      t.integer    :shipping_fee,   null:false

      t.integer    :shipping_area,  null:false
       
      t.integer    :shipping_days,  null:false
      t.integer    :price,          null:false
      t.references :user,           null:false

      t.timestamps

    end
  end
end

