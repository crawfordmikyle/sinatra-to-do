class UserController < ApplicationController
	use Rack::Flash
	get '/' do
		erb :index
	end 

	get '/signup' do
		if logged_in?
			@user = current_user
			redirect "/users/#{@user.slug}"
		else 
			erb :'users/new_user'
		end 
	end 

	post '/users/new' do
		if valid_user_params? && !user_already_exists?
			@user = User.create(params)
			redirect "/users/#{@user.slug}"
		else
			flash[:message] = "Invalid Entry"
			redirect '/signup'
		end 
	end 
end 