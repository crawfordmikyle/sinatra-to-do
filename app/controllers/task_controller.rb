class TaskController < ApplicationController
use Rack::Flash
	get '/tasks/new' do
		if logged_in?
			@user = current_user
			erb :'tasks/new_task'
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end 
	end 

	post '/tasks/new' do
		if logged_in?
			@user = current_user
			params[:user_id] = @user.id
			@task = Task.create(params)
			redirect "/users/#{@user.slug}"
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end 
	end 

	get '/tasks/:id' do
		if logged_in?
			@user = current_user
			@task = Task.find_by_id(params[:id])
			if @task.user_id == @user.id
				erb :'tasks/show_task'
			else
				flash[:message] = "You can only view tasks you create"
				redirect "/users/#{@user.slug}"
			end 
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end 
	end 

	get '/tasks/:id/edit' do
		if logged_in?
			@user = current_user
			@task = Task.find_by_id(params[:id])
			binding.pry
			if @task.user_id == @user.id
				erb :'tasks/edit_task'
			else
				flash[:message] = "You can only edit tasks you create"
				redirect "/users/#{@user.slug}"
			end 
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end 
	end 

	patch '/tasks/:id/edit' do
		if logged_in?
			@user = current_user
			@task = Task.find_by_id(params[:id])
			if @task.user_id == @user.id
				params[:user_id] = @user.id
				@task.update(params)
				flash[:message] = "Task Updated"
				redirect "/users/#{@user.slug}"
			else
				flash[:message] = "You can only delete tasks you create"
				redirect "/users/#{@user.slug}"
			end 
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end
	end 

	delete '/tasks/:id/delete' do
		if logged_in?
			@user = current_user
			@task = Task.find_by_id(params[:id])
			if @task.user_id == @user.id
				@task.delete
				flash[:message] = "Task Deleted"
				redirect "/users/#{@user.slug}"
			else
				flash[:message] = "You can only delete tasks you create"
				redirect "/users/#{@user.slug}"
			end 
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end 
	end 


end 