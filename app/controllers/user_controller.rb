class UserController < ApplicationController
	get '/' do
		erb :index
	end 

	get '/signup' do
		erb :'users/new_user'
	end 
end 