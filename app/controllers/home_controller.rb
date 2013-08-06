class HomeController < ApplicationController
    def index
    @users = User.all
     @statuses = Status.all
  end

  def show
    @user = User.find(params[:id])
    @statuses = Status.all
  end
end