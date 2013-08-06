class StatusesController < ApplicationController
  def index
  @users = User.all
   @statuses = Status.all

  end

  def new
    @users = User.all
    @statuses = Status.all
    @status = Status.new

  end

  def create
    # binding.pry
    @status = current_user.statuses.create(params[:status])
    redirect_to(root_path)
  end

  def show
    # @users = User.all
    # @statuses = Status.all
    @status = Status.find(params[:id])
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
      redirect_to(new_status_path)
  end


end

#     @statuses = Status.all

#     respond_to do |format|
#       format.html
#       format.json { render json: @statuses }
#     end
#   end

#   def show
#     @status = Status.find(params[:id])

#     respond_to do |format|
#       format.html
#       format.json { render json: @status }
#     end
#   end

#   def new
#     @status = Status.new

#     respond_to do |format|
#       format.html
#       format.json { render json: @status }
#     end
#   end

#   # GET /statuses/1/edit
#   def edit
#     @status = Status.find(params[:id])
#   end

#   def create
#     @status = Status.new(params[:status])

#     respond_to do |format|
#       if @status.save
#         format.html { redirect_to @status, notice: 'Status was successfully created.' }
#         format.json { render json: @status, status: :created, location: @status }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @status.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def update
#     @status = Status.find(params[:id])

#     respond_to do |format|
#       if @status.update_attributes(params[:status])
#         format.html { redirect_to @status, notice: 'Status was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @status.errors, status: :unprocessable_entity }
#       end
#     end
#   end


#   def destroy
#     @status = Status.find(params[:id])
#     @status.destroy

#     respond_to do |format|
#       format.html { redirect_to statuses_url }
#       format.json { head :no_content }
#     end
#   end
# end
