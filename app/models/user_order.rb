class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :municipality
    validates :address
    validates :phone_number, length: {maximum: 11 }
  end

  validates :prefecture_id, numericality: { other_than: 0}
  validates :token, presence: true

  def save
    Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code,
      municipality: municipality,
      address: address,
      prefecture_id: prefecture_id,
      phone_number: phone_number 
    )
  end
end