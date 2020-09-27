class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :order

  with_options presence: true do
    validates :postal_code, exclusion: { in: ["-"] }
    validates :prefecture_id,  numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number,  length: { maximum: 11 },numericality: { only_integer: true }
    validates :order
  end
  
end
