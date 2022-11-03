class SessionsController < ApplicationController
  #  before_action :authenticate_user, only: [:index]
  def index
  end

    def new
      
    end

    def create
      id = session[:user_id]
      @user = user.find(title: params[:title], content: params[:content], user_id: user.id)
    end

    def destroy
      user = user.find(params["id"])
      user.destroy
      redirect_to_sessions_path
    end

  private
    def authenticate_user
      unless current_user
      flash[:danger] = "Please log in."
      redirect_to_session_path
      end
    end
end
