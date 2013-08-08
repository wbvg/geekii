class ProfilesController < ApplicationController

  def index
    @users = User.all
    @profiles = Profile.order(:chapter).order(:created_at)
    @chapters = Profile.all.map(&:chapter).uniq.sort
  end

  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.create(params[:profile])
    current_user.profiles << profile
    @profiles = @user.profiles.order(:chapter).order(:created_at)
    @chapters = @user.profiles.map(&:chapter).uniq.sort
  end

  def chart
    render :json => Profile.where(:chapter=> params[:chapter]).all
  end

  #  def chart
  #   render :json => @auth.exercises.where(:activity => params[:activity])
  # end



end
