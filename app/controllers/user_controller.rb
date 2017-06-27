class UserController < ApplicationController
	get '/' do
		erb :index
	end 

	get '/signup' do
		erb :'users/new_user'
	end 

	post '/users/new' do
		binding.pry
	end 
end 