require 'spec_helper'

describe AboutController do

  describe "GET 'show'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end



  end


end