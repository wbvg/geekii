require 'spec_helper'

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

 describe Status do

  before(:each) do
    @status_attr = {
      :user_id => "1",
      :category => "UX | UI Designer",
      :status => "Hi I need help",
      :need_help => true
    }
      @status = Status.create(@status_attr)
    end

    describe "status belongs to user relationship test" do
     it { should belong_to :user }
    end

  describe "category" do

       it "should have a category attribute" do
        @status.category.should eq ("UX | UI Designer")
      end

      it "should reject over 40 character limit strings" do
        max_characters = "a" * 41
        hash = @status_attr.merge(:category => max_characters)
        Status.new(hash).should_not be_valid
      end

      it "should accept under 40 character limit strings" do
        max_characters = "a" * 18
        hash = @status_attr.merge(:category => max_characters)
        Status.new(hash).should be_valid
      end

   end

    describe "status" do

      it "should reject over 200 character limit strings" do
        max_characters = "a" * 201
        hash = @status_attr.merge(:status => max_characters)
        Status.new(hash).should_not be_valid
      end

      it "should accept under 200 character limit strings" do
        max_characters = "a" * 18
        hash = @status_attr.merge(:status => max_characters)
        Status.new(hash).should be_valid
      end

      it "should create a new instance given a valid attribute" do
      Status.create!(@status_attr)
      end
    end

  describe "user id" do
       it "should have a user id attribute" do
        @status.user_id.should eq (1)
       end
  end

 describe "need_help" do
       it "should accept" do
        @status.need_help.should eq (true || false )
        accept = true || false
        hash = @status_attr.merge(:need_help => accept)
        Status.new(hash).should be_valid
       end
  end


end