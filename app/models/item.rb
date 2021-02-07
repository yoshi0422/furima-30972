class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id 
    validates :prefectures_id 
    validates :delivery_days_id 
  end

  belongs_to :users
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefectures
  belongs_to :delivery_days
end
