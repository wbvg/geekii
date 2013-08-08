class HomeController < ApplicationController
  def index
    @users = User.all
    @statuses = Status.chronological.paginate(:page => params[:page], :per_page => 4)



  end

  def show
    @user = User.find(params[:id])
  end



end