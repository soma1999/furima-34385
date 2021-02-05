class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :shipping_day

  validates :title, :description , :category_id , :item_state_id , :shipping_fee_id, :prefecture_id, :shipping_day_id, presence: true, unless: :was_attached?

  with_options presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }do
    validates :price
  end

  validates :category_id , :item_state_id , :shipping_fee_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 0 } 

  def was_attached?
    self.image.attached?
  end
end
