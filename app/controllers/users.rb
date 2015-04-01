# all users
get '/users' do
  @users = User.all
  erb :'users/index'
end



# new user
get '/users/new' do
  @user = User.new
  erb :"users/new"
end

# one user
get '/users/:id' do
  @user = User.find(params[:id])
  if session[:user_id] == @user.id
    erb :'users/show'
  else
    redirect '/'
  end   
end

#login
get '/login' do
  erb :login
end

post '/login' do
  user = User.authenticate(params[:username],params[:password])
  
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    @message = "Try again"
    erb :login
  end
end

#logout
get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

# edit a user
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

post '/users' do
  user = User.new params[:user]
  if user.save
    redirect "/users/#{user.id}"
  else
    erb :"users/new"
  end
end

put '/users/:id' do
  user = User.find(params[:id])
  user.update
  redirect "/users/#{params[:id]}"
end

delete '/users/:id' do
  user = User.find(params[:id])
  session.delete(:user_id)
  user.destroy
  redirect "/"
end
