require 'faker'

User.create!(username: "Dan", password: "1234")
User.create!(username: "Mike", password: "1234")
Wishlist.create!(name: "My Great List", user_id: 1)

ProductsWishlist.create!(product_id: 1, wishlist_id: 1)
ProductsWishlist.create!(product_id: 2, wishlist_id: 1)
ProductsWishlist.create!(product_id: 3, wishlist_id: 1)

10.times do
  Product.create!(name: Faker::Commerce.product_name, category_id: (1+rand(10)))
end

10.times do
  Category.create!(name: Faker::Commerce.department)
end