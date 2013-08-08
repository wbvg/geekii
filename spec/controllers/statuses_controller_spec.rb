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

    context 'when not valid' do
    it { should respond_with 422 }
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