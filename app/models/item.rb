class Item < ApplicationRecord

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :shipping_fee
    belongs_to_active_hash :shipping_area
    belongs_to_active_hash :shipping_day


    belongs_to :user
    has_one :order

    has_one_attached :image

    with_options presence: true do
      validates :itemname,  length: { maximum: 40 }
      validates :detail,  length: { maximum: 1000 }
      validates :category_id,  numericality: { other_than: 1 }
      validates :condition_id,  numericality: { other_than: 1 }
      validates :shipping_fee_id,  numericality: { other_than: 1 }
      validates :shipping_area_id,  numericality: { other_than: 1 }
      validates :shipping_day_id,  numericality: { other_than: 1 }
      validates :price,  length: { maximum: 7 }
      validates :price, :numericality => { :greater_than_or_equal_to => 300 }
      validates :price, :numericality => { :less_than_or_equal_to => 9999999 }
      validates :image
      validates :user
    end

end


