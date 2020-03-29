class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }

  has_many :likes
  has_many :liked_items, :through => :likes, :source => :item
  has_many :nopes
  has_many :noped_items, :through => :nopes, :source => :item

  def find_liked_items_in_common_with(other_user)
    self.liked_items & other_user.liked_items
  end
  
end
