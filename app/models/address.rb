class Address < ApplicationRecord

  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :prefectures
    validates :city
    validates :address
    validates :phone_number
    validates :order
  end
  

end
