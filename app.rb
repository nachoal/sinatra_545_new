require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @restaurants = Restaurant.all
  erb :index # ALL
end

# Individual page for a restaurant (with id)
get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])

  erb :show # One record
end

post '/restaurants' do
  # params = {name: 'value from user', city: 'value from user'}
  name = params[:name]
  city = params[:city]

  restaurant = Restaurant.new(name: name, city: city)

  restaurant.save

  redirect '/'
end

# MVC
# VERB 'URL' do
# end
# Router: app.rb
# Controller: app.rb
# 1. Create the database - rake db:create
# 2. Create the migration to add restaurants(name, city, timestamps)
# 3. rake db:migrate
# 4. Add models/restaurant.rb and its class
# 5. Create a seed file with 10 restaurants using faker
