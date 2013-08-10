require 'spec_helper'

describe Profile do

before(:each) do
    @profile_attr = {
      :user_id => "1",
      :chapter => "General Assembly",
      :label => "Javascript",
      :value => 100
    }
      @profile = Profile.create(@profile_attr)
    end


describe "profile belongs to user relationship test" do
     it { should belong_to :user }
   end

  describe "user id" do
       it "should have a user id attribute" do
        @profile.user_id.should eq (1)
       end
  end



  describe "chapter" do
       it "should have a chapter attribute" do
        @profile.chapter.should eq ("General Assembly")
      end

      it "should reject over 40 character limit strings" do
        max_characters = "a" * 41
        hash = @profile_attr.merge(:chapter => max_characters)
        Profile.new(hash).should_not be_valid
      end

      it "should accept under 40 character limit strings" do
        max_characters = "a" * 18
        hash = @profile_attr.merge(:chapter => max_characters)
        Profile.new(hash).should be_valid
      end
   end

  describe "label" do
       it "should have a chapter attribute" do
        @profile.label.should eq ("Javascript")
      end

      it "should reject over 30 character limit strings" do
        max_characters = "a" * 31
        hash = @profile_attr.merge(:label => max_characters)
        Profile.new(hash).should_not be_valid
      end

      it "should accept under 30 character limit strings" do
        max_characters = "a" * 18
        hash = @profile_attr.merge(:label => max_characters)
        Profile.new(hash).should be_valid
      end
   end

     describe "value" do
       it "should have a value attribute" do
        @profile.value.should eq (100)
      end

      it "should reject over 3 character limit" do
        max_characters = "1" * 45
        hash = @profile_attr.merge(:value => max_characters)
        Profile.new(hash).should_not be_valid
      end

      it "should accept integer character limit" do
        max_characters = "1" * 2
        hash = @profile_attr.merge(:value => max_characters)
        Profile.new(hash).should be_valid
      end

       it "should allow valid value values" do
      (1..100).to_a.each do |v|
       should allow_value(v).for(:value)
        end
     end
   end

end