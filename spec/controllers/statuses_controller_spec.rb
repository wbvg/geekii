require 'spec_helper'


describe StatusesController do

  describe 'Show Page' do
    before do
      get :index
    end

   it "should have a status attribute" do
     expect(assigns(:statuses)).to be
  end

    # context 'when not valid' do
    # it { should respond_with 422 }
    #   end

    # it "should be logged in to post a status" do
    #   post :create, status: { status: "Hi I need help"}
    #   assert_response :redirect
    #   assert_redirected_to new_user_session_path
    # end

    # it "should create status when logged in" do
    #   sign_in users(:willy)
    #   assert_difference ('Status.count') do
    #     post :create, status: { status: @status_attr }
    #   end
    # end
    end
end


    # it "should be successful" do
    #   get :index
    #   response.should be_success
    # end

    # it "should be successful" do
    #   get :new
    #   response.should be_success
    # end


    # it "should be successful" do
    #   get :edit
    #   response.should be_success
    # end
