class ApplicationController < ActionController::Base
  protect_from_forgery

    # def profile_user
    #  if user_signed_in?
    #     # I turned profile browsing page off until version 2
    #     # return @profiles = current_user.profiles.order(:chapter).order(:created_at)
    #     return @chapters = current_user.profiles.map(&:chapter).uniq.sort
    #   else
    #     # return @profiles = @user.profiles.order(:chapter).order(:created_at)
    #     return @chapters = @user.profiles.map(&:chapter).uniq.sort
    #   end
    # end

end
