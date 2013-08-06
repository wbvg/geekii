require 'spec_helper'
require 'status'

describe StatusesController do

  describe 'Show Page' do
    before do
      get :index
    end

     it "should be successful" do
      get :index
      response.should be_success
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

end