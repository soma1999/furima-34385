class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\d{11}/ }
  end

  validates :prefecture, numericality: { other_than: 0}

  def save
    Order.create(item_id: item.id, user_id: user.id)
    Address.create(
      postal_code: postal_code,
      municipality: municipality,
      adress: address,
      prefecture: prefecture,
      phone_number: phone_number 
    )
  end
end