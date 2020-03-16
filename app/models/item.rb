class Item < ApplicationRecord
  has_many :liking_users, :through => :likes, :source => :user
  has_many :noping_users, :through => :nopes, :source => :user
end
