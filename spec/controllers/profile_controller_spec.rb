require 'spec_helper'

describe StatusesController do

  before do
  @user = User.create(:email => 'willy@gmail.com', :password => '123456', :password_confirmation => '123456', :occupation => "UX | UI Designer",   :location => "Sydney", :username => "willy")
  request.session[:user_id] = @user.id

  @p5 = Profile.create(:label => 'Mobile UX', :value => 100, :chapter => 'Sydney Web Designer', :user_id => @user.id)
  @p6 = Profile.create(:label => 'Axure Wireframing', :value => 100, :chapter => 'Sydney Web Designer',:user_id => @user.id)
  @p7 = Profile.create(:label => 'Prototyping', :value => 70, :chapter => 'Sydney Web Designer',:user_id => @user.id)

  end

    describe 'as HTML' do
      before do
        get :index
      end

      it 'should respond with a status 200' do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end
    end

 describe "as JSON" do
      before do
        get :new, :format => :json
      end
    end

 #      it "should respond with a status 200" do
 #        expect(response).to be_success
 #        expect(response.status).to eq(200)
 #      end

 #      it "should give content type JSON" do
 #        expect(response.content_type).to eq('application/json')
 #      end

 #      it "should parse as JSON" do
 #        lambda { JSON.parse(response.body) }.should_not raise_error
 #      end

 #      it "should put the Status category in the JSON" do
 #        status = JSON.parse(response.body)
 #        expect(status.length).to eq(3)
 #        expect(status.first["status"]).to eq("Status 3")
 #      end
    # end
  end