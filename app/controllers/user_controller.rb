require 'rack-flash'
class UserController < ApplicationController
use Rack::Flash
	get '/' do
		if logged_in?
			@user = current_user
			redirect "/users/#{@user.slug}"
		else
			erb :index
		end 
	end 

	get '/signup' do
		if logged_in?
			@user = current_user
			redirect "/users/#{@user.slug}"
		else 
			erb :'users/new_user'
		end 
	end 

	get '/login' do 
		if logged_in?
			@user = current_user
			redirect "/users/#{@user.slug}"
		else 
			erb :'users/login'
		end 
	end 

	post '/login' do
		if is_user?
			@user = User.find_by(email: params[:email]).authenticate(params[:password])
				if @user
					session[:user_id] = @user.id
					redirect "/users/#{@user.slug}"
				else
					flash[:message] = "Invalid Login"
					redirect "/login"
				end 
		else
			flash[:message] = "Invalid Login"
			redirect "/login"
		end 
	end 

	post '/users/new' do
		if valid_user_params? && !user_already_exists?
			@user = User.create(params)
			session[:user_id] = @user.id
			redirect "/users/#{@user.slug}"
		else
			flash[:message] = "That email is already in use or you did not enter valid input"
			redirect '/signup'
		end 
	end 

	get '/users/:slug' do 
		if logged_in?
			@user = User.find_by_slug(params[:slug])
			@user_tasks = Task.all.select{|t| t.user_id ==@user.id}
			erb :'users/show_user'
		else
			flash[:message] = "You need to be logged in to do that"
			erb :'users/login'
		end 
	end 

	get '/logout' do
		session.clear
		redirect '/'
	end 
end 