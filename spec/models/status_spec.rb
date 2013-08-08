require 'spec_helper'

describe Status do
#   it { should belongs_to :users }
# e nd

  # == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  category   :string(255)
#  status     :string(255)
#  need_help  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

  # def initialize
  #   @status_attr
  # e nd

 describe "A status" do

  before(:each) do
    @status_attr = {
      :user_id => "1",
      :category => "UX | UI Designer",
      :status => "Hi I need help",
      :need_help => "f"
    }
  end

    before(:each) do
        @status= Status.new(@status_attr)
    end

    it "should be logged in to post a status" do
      post :create, status: { status: "Hi I need help"}
      assert_response :redirect
      assert_redirected_to new_user_session_path
    end

    it "should create status when logged in" do
      sign_in users(:willy)
      assert_difference ('Status.count') do
        post :create, status: { status: @status_attr }
      end
    end

    it "should create a new instance given a valid attribute" do
    Status.create!(@status_attr)
    end

  it "should have a status with a user id" do
    status = Status.new
    @status_attr.status = "Hi I need help"
    assert !status.save
    assert !status.errors[:user_id].empty?
  end

    it "status requires all content" do
      status = Status.new
      assert !status.save
      assert !status.errors[:status].empty?
    end


      it "should have a category attribute" do
      status = Status.new
      @status_attr.should respond_to(:category)
      @status_attr.category?.should == true
      end

    #    it "passes if the length is correct" do
    #   expect {
    #     expect("this string").length to have(11).characters
    #   }.to pass_with("expected 11 characters, got 11")
    # end

    #   it "fails if the length is incorrect" do
    #   expect {
    #     expect("ahhhhhhhhhhhhhhhhhhhhhhhh hi daniel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhh hi joel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhh hi daniel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhh hi daniel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhh hi daniel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhhhhhhhh").length to have(256).characters
    #   }.to fail_with("expected 255 characters, got 256")
    # end
  end

  end