require 'spec_helper'


describe HomeController do

  # before (:each) do
  #   @user = FactoryGirl.create(:user)
  #   sign_in @user
  # end

  describe "GET 'index'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should render the index template" do
        expect(response).to render_template("index")
    end

  end
end