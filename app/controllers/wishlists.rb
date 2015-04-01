

get '/users/:user_id/wishlists/:id/edit' do

  @user = User.find(params[:user_id])
  @list = User.find(params[:id])

  erb :'wishlists/edit'
end

get '/users/:user_id/wishlists/:id' do
  @user = User.find(params[:user_id])
  @products = Product.all
  if session[:user_id] == params[:user_id].to_i
    @list = Wishlist.find(params[:id])
    erb :'wishlists/show'
  else
    redirect '/'
  end   
end

post '/users/:user_id/wishlists/:id' do
  # params[:product_id]
  wishlist = Wishlist.find(params[:id])
  product = Product.find(params[:product_id])
  wishlist.products << product
  redirect "/users/#{params[:user_id]}/wishlists/#{params[:id]}"
end

post '/users/:user_id/wishlists' do
  user = User.find(params[:user_id])
  wishlist = Wishlist.new(name: params[:name], user: user )
  if wishlist.save
    redirect "/users/#{params[:user_id]}"
  else
    @error = "Save not Successful"
    erb :"users/#{params[:user_id]}"
  end 
end

put '/users/:user_id/wishlists/:id' do
  user = User.find(params[:id])
  user.update
  redirect "/users/#{params[:id]}"
end

delete '/users/:user_id/wishlists/:id' do
  list = Wishlist.find(params[:id])
  list.destroy
  redirect "/users/#{ params[:user_id] }"
end

delete '/users/:user_id/wishlists/:id/item' do
  wishlist = Wishlist.find(params[:id])
  product = Product.find(params[:product_id])
  wishlist.products.delete(params[:product_id])
  redirect "/users/#{params[:user_id]}/wishlists/#{params[:id]}"
end
