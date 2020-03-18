class Like < ApplicationRecord
  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :item_id, presence: true, numericality: {only_integer: true}

  belongs_to :user
  belongs_to :item
end
