class OrderAddress

  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefectures, :city, :address, :building_name, :phone_number, :order

  with_options presence: true do
    validates :user
    validates :item
    validates :postal_code
    validates :prefectures
    validates :city
    validates :address
    validates :phone_number
    validates :order
  end

  def save
    order = Order.create(user: user, item: item)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, phone_number: phone_number,order: order)
  end

end