class UsersController < ApplicationController
    before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @statuses = Status.all
  end

    def new
      @user = User.new
      @users = User.all
      @statuses = Status.all
    end

   # def create
   #      user = User.create(params[:user])
   #      redirect_to(user)
   #  end

    def edit
       @status = current_user.status.find(params[:id])
        @user = User.find(params[:id])
    end

   #  def update
   #      user = User.find(params[:id])
   #      user.update_attributes(params[:user])
   #      redirect_to(user)
   #  end

end