get '/' do
  @products = Product.all
  
  erb :index
end
