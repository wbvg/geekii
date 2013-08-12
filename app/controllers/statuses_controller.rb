class StatusesController < ApplicationController
  def index
   @users = User.all
   @statuses = Status.chronological.paginate(:page => params[:page], :per_page => 4)
   @status_last = Status.last
   @status = Status.new
  end

  def new
    @users = User.all
    @statuses = Status.chronological.paginate(:page => params[:page], :per_page => 4)
    @status = Status.new
    @status_last = Status.last

  end

  def create
    @status = current_user.statuses.new(params[:status])
    # binding.pry
    @status.save
    redirect_to(new_status_path)
  end

  def show
    # @users = User.all
    # @statuses = Status.all
    @statuses = Status.chronological.paginate(:page => params[:page], :per_page => 4)
    @status = Status.find(params[:id])
    @status_last = Status.last

  end

  def edit
   @status = Status.find(params[:id])

  end

  def update
    status = Status.find(params[:id])
    status.update_attributes(params[:status])
    # @status = current_user.statuses.new(params[:status])
    redirect_to(status_path)
  end

  def destroy
    status = Status.find(params[:id])
    status.destroy
    redirect_to(user_path(current_user))
  end

end

