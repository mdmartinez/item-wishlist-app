class Product < ActiveRecord::Base
  has_many :products_wishlists
  has_many :wishlists, through: :products_wishlists
  has_many :users, through: :wishlists

  belongs_to :category
end
