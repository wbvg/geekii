require 'spec_helper'
require 'user'

describe AboutController do

  describe "GET 'show'" do

    it "should be successful" do
      get :index
      response.should be_success
    end

  end


end