class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :products_wishlists
  has_many :products, through: :products_wishlists
end
