require 'spec_helper'

describe HomeController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'show'" do

    it "should be successful" do
      get :show, :username => @user.username
      response.should be_success
    end

    it "should find the right user" do
      get :show, :username => @user.username

      assigns(:user).should == @user
    end
  end
end