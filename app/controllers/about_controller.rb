class AboutController < ApplicationController
  def index
    @users = User.all
    @statuses = Status.all
  end
end