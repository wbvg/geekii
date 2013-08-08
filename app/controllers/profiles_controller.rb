class ProfilesController < ApplicationController

  def index
    @profiles = @user.profiles.order(:label).order(:created_at)
    @labels = @user.profiles.map(&:label).uniq.sort
  end

  def new
    @profiles = Profile.new
  end

  def create
    profile = Profile.create(params[:label])
    current_user.profiles << profile
    @profiles = @user.profiles.order(:label).order(:created_at)
    @labels = @user.profiles.map(&:label).uniq.sort
  end

  def chart
    render :json => @user.profiles.where(:label => params[:label])
  end

end
