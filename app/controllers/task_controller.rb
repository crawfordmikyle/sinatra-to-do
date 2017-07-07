require 'rack-flash'
class TaskController < ApplicationController

	get '/tasks/new' do
		if logged_in?
			erb :'tasks/new_task'
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end
	end

	post '/tasks/new' do
		if logged_in?
			@task = current_user.tasks.build(params)
			if @task.save
				redirect "/users/#{current_user.slug}"
			else
				flash[:message] = @task.errors
				erb :'/tasks/new_task'
			end
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end
	end

	get '/tasks/:id' do
		if logged_in?
			@task = Task.find_by_id(params[:id])
			if @task.user == current_user
				erb :'tasks/show_task'
			else
				flash[:message] = "You can only view tasks you create"
				redirect "/users/#{current_user.slug}"
			end
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end
	end

	get '/tasks/:id/edit' do
		if logged_in?
			@task = Task.find_by_id(params[:id])
			if @task.user == current_user
				erb :'tasks/edit_task'
			else
				flash[:message] = "You can only edit tasks you create"
				redirect "/users/#{current_user.slug}"
			end
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end
	end

	patch '/tasks/:id/edit' do
		if logged_in?
			@task = Task.find_by_id(params[:id])
			if @task.user == current_user
				params[:task][:user_id] = current_user.id
				@task.update(params[:task])
				flash[:message] = "Task Updated"
				redirect "/users/#{current_user.slug}"
			else
				flash[:message] = "You can only delete tasks you create"
				redirect "/users/#{current_user.slug}"
			end
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end
	end

	delete '/tasks/:id/delete' do
		if logged_in?
			@task = Task.find_by_id(params[:id])
			if @task.user == current_user
				@task.delete
				flash[:message] = "Task Deleted"
				redirect "/users/#{current_user.slug}"
			else
				flash[:message] = "You can only delete tasks you create"
				redirect "/users/#{current_user.slug}"
			end
		else
			flash[:message] = "You need to be logged in to do that"
			redirect '/login'
		end
	end


end
