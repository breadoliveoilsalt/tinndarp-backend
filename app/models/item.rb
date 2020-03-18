class Item < ApplicationRecord
  has_many :likes
  has_many :liking_users, :through => :likes, :source => :user
  has_many :nopes
  has_many :noping_users, :through => :nopes, :source => :user

  def self.all_unrated_by(user)
    user = User.find_by(id: user.id)
    items_liked_by_user = user.liked_items
    items_noped_by_user = user.noped_items
    Item.all - items_liked_by_user - items_noped_by_user
  end
end
