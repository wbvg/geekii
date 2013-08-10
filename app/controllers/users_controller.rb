class UsersController < ApplicationController
    before_filter :authenticate_user!, :except => [:show,:index]

  def index
    @users = User.all
    @statuses = Status.chronological.paginate(:page => params[:page], :per_page => 4)
  end

  def show
    @user = User.find(params[:id])
    @statuses = @user.statuses.chronological.paginate(:page => params[:page], :per_page => 4)
    @chapters = @user.profiles.map(&:chapter).uniq.sort
      # @chapters = Profile.all.map(&:chapter).uniq.sort
      #  if user_signed_in?
      # @profiles = Profile.order(:chapter).order(:created_at)
      # @profiles = current_user.profiles.order(:chapter).order(:created_at)
      #  @profiles = @user.profiles.order(:chapter).order(:created_at)
      #  if user_signed_in?
      #   @chapters = current_user.profiles.map(&:chapter).uniq.sort
  end

    def new
      @user = User.new
      @users = User.all
      @statuses = Status.chronological.paginate(:page => params[:page], :per_page => 4)
      @user_status_caps = status.status
    end

    # def create
    #      user = User.create(params[:user])
    #      redirect_to(user)
    #  end

    def edit
       @status = current_user.status.find(params[:id])
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update_attributes(params[:user])
        redirect_to(user)
    end

end