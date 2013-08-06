require 'spec_helper'

describe Status do

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
  # end


  before(:each) do
    @status_attr = {
      :user_id => "1",
      :category => "UX | UI Designer",
      :status => "Hi I need help",
      :need_help => "f"
    }
  end

    it "should create a new instance given a valid attribute" do
    Status.create!(@status_attr)
    end


    describe "category" do

      before(:each) do
        @status= Status.new(@status_attr)
      end

      it "should have a category attribute" do
      status = Status.new
      @status.should respond_to(:category)
      status.category?.should == true
      end

    end

      it "should have status" do
      status = Status.new
      status.status?.should == true
      end


      it "should belong to user" do
        status = Status.new
        user.status.should == true
      end

  describe "status" do

     before(:each) do
      @status = Status.new(@status_attr)
    end

       it "passes if the length is correct" do
      expect {
        expect("this string").length to have(11).characters
      }.to pass_with("expected 11 characters, got 11")
    end

      it "fails if the length is incorrect" do
      expect {
        expect("ahhhhhhhhhhhhhhhhhhhhhhhh hi daniel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhh hi joel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhh hi daniel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhh hi daniel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhh hi daniel ahhhhhhhhahhhhhhhhhhhhhhhhhhhhhhhhhhhhhh").length to have(256).characters
      }.to fail_with("expected 255 characters, got 256")
    end

  end


  end