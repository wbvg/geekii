class HomeController < ApplicationController
    def index
    @users = User.all
     @statuses = Status.all
     # @status = current_user.statuses.create(params[:status])
    # def user_avatar
    #   user.avatar if user
    # end


  end

  def show
    @user = User.find(params[:id])
    @statuses = Status.all
  end



end