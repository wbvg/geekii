require 'spec_helper'
require 'capybara'


describe StatusesController do

  describe 'Get statuses for a particular user' do

  @user = User.create(:email => 'willy@gmail.com', :password => '123456', :password_confirmation => '123456', :occupation => "UX | UI Designer",   :location => "Sydney", :username => "willy")

    @s1 = Status.create(:category => "UX | UI Designer", :status => "Hi I need help", :need_help => true, :user_id => @user.id)
    @s2 = Status.create(:category => "Web Developer", :status => "Hi I need help with a Joomla Developer", :need_help => true, :user_id => @user.id)
    @s3 = Status.create(:category => "Back-End Developer", :status => "Hi I need help with UX", :need_help => false, :user_id => @user.id)

    @statuses = Status.all

  end

    describe 'as HTML' do
      before do
        get :index
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

        it "should give the statuses in an instance variable in desc order" do
        # expect(assigns(@statuses)).to be
        # # expect(Status.count).to eq(3)
        # expect(assigns(Status).first.class).to eq(Status)
        # expect(assigns(Status).first.status).to eq("Hi I need help with UX")
      end

      it "should render the index template" do
        expect(response).to render_template("index")
      end
    end



  describe 'POST to create' do
    describe 'a status with valid information' do
      before do
        @user = User.create(:email => 'willy@gmail.com', :password => '123456', :password_confirmation => '123456', :occupation => "UX | UI Designer",   :location => "Sydney", :username => "willy")
# request.session[:user_id] = @user.id

        # post :create, { :status => {:category => "UX | UI Designer", :status => "Hi I need help", :need_help => true }}
      end

      #  it "should be created successfully" do
      #   expect(response.status).to eq(302)
      #   expect(assigns(:status).category).to eq("UX | UI Designer")
      # end

      # it "should render the show template" do
      #   expect(response).to(redirect_to(statuses_path))
      # end

    end
   end

   describe 'GET to index' do

  #  it "should have a status attribute" do
  #    expect(assigns(:status)).to be
  # end

  #   it "should render the show template" do
  #       get :show, {:id => @status.id}
  #     expect(response).to render_template("show")
  #     end

  #  it "should assign a status instance variable" do
  #      expect(assigns(:statuses).first.class).to eq(Status)
  #   end

  #     it "should mention the status on the page" do
  #    expect(assigns(:statuses).first.status).to eq("Hi I need help with UX")
  #   end
  end



describe 'Edit' do
     before do
        @user = User.create(:email => 'willy@gmail.com', :password => '123456', :password_confirmation => '123456', :occupation => "UX | UI Designer",   :location => "Sydney", :username => "willy")
request.session[:user_id] = @user.id

        status = Status.create(:category => "Web Developer", :status => "Hi I need help with a Joomla Developer", :need_help => true, :user_id => @user.id)

        get :edit,{ :id => status.id}
      end

      it "should be displayed for edit successfully" do
        expect(response.status).to eq(200)
      end
  end

  describe 'Edit to update' do
     before do
#         @user = User.create(:email => 'willy@gmail.com', :password => '123456', :password_confirmation => '123456', :occupation => "UX | UI Designer",   :location => "Sydney", :username => "willy")
# request.session[:user_id] = @user.id

#         status = Status.create(:category => "Web Developer", :status => "Hi I need help with a Joomla Developer", :need_help => true, :user_id => @user.id)

#         put :update,{ :id => status.id, :status => {:category => "Web Developer", :status => "Hi I need help with a Joomla Developer", :need_help => true }}
      end

      # it "should be updated successfully" do
      #   expect(response.status).to eq(302)
      #   expect(assigns(:status).category).to eq("Web Developer")
      # end
    end

  describe 'delete' do
#     before do
#               @user = User.create(:email => 'willy@gmail.com', :password => '123456', :password_confirmation => '123456', :occupation => "UX | UI Designer",   :location => "Sydney", :username => "willy")
# request.session[:user_id] = @user.id

#         status = Status.create(:category => "Web Developer", :status => "Hi I need help with a Joomla Developer", :need_help => true, :user_id => @user.id)
#       delete :destroy,{ :id => user.id}
#     end

#     it "should be deleted successfully" do
#       expect(response.status).to eq(302)
#     end
  end


    describe 'a status without a category' do
      # before do
      #   post :create, {}
      # end

      # it 'should give us a 200 success' do
      #   expect(response.status).to eq(200)
      # end

      # it 'should render the new template' do
      #   expect(response).to render_template("new")
      # end

      # it 'should not increase the number of statuses' do
      #   expect(Status.count).to eq(0)
      # end
    end


    it "index template should be successful" do
      get :index
      response.should be_success
    end

    it "new template should be successful" do
      get :new
      response.should be_success
    end





end



