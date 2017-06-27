require 'rack-flash'
class ApplicationController < Sinatra::Base
set :views, Proc.new { File.join(root, "../views/") }

configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
	set :session_secret, "Ruby For Dayz"
 end

helpers do
	def logged_in?
      !!current_user
  end

  def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_an_email?
      if params[:email].include?("@") && params[:email].include?(".")
        true
      else
        false
      end 
    end 
  end

  def valid_user_params?
    if !params[:firstname].empty? && !params[:lastname].empty? && !params[:password].empty? && is_an_email?
      true
    else
      false
    end 
  end 

  def user_already_exists?
    if User.find_by(email: params[:email])
      true
    else 
      false
    end 
  end

  def is_user?
    if User.find_by(email: params[:email])
      true
    else
      false
    end 
  end
end 