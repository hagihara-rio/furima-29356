class Item < ApplicationRecord

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :shipping_area




    validates :shipping_area, presence: true
    validates :genre_id, numericality: { other_than: 1 } 




  belongs_to :user
  
  has_one_attached :image


end
