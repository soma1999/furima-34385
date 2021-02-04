class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  validates :title, :description , :category_id , :item_state_id , :shipping_fee_id, :prefecture_id, :shipping_day_id, presence: true, unless: :was_attached?

  with_options presence: true, format: { with: [3-9][0-9]{2}|[1-9][0-9]{3,6} } do
    validates :price
  end

  def was_attached?
    self.image.attached?
  end
end
