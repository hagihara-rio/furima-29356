class Item < ApplicationRecord

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :shipping_fee
    belongs_to_active_hash :shipping_area
    belongs_to_active_hash :shipping_days


    validates :itemname, :detail, :category, :condition, :shipping_fee, :shipping_area, :shipping_days, :price, :user, presence: true
    validates :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_days_id, numericality: { other_than: 1 }
    validates :itemname, length: { maximum: 40 }
    validates :detail, length: { maximum: 1000 }
    validates :price, length: { maximum: 7 }
    validates :price, :numericality => { :greater_than_or_equal_to => 300 }  # 数字が300以上であるか
    validates :price, :numericality => { :less_than_or_equal_to => 9999999 }  # 数字が9999999以下であるか


  belongs_to :user

  has_one_attached :image


end


