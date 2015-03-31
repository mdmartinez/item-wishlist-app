get '/wishlists/:id' do
  if current_user
    @list = Wishlist.find(params[:id])
    erb :'wishlists/show'
  else
    redirect '/'
  end   
end