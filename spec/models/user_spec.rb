

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string(255)
#  location               :text
#  occupation             :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

require 'spec_helper'

describe User do

  before(:each) do
    @login_attr = {
      :username => "Willy",
      :location => "Sydney",
      :occupation => "UX | UI Designer",
      :email => "user@example.com",
      :password => "123456",
      :password_confirmation => "123456",
      :avatar_file_name => "willy_fb_profile.jpg",
      :avatar_content_type => "image/jpeg",
      :avatar_file_size => "38103"
    }
  end

  def valid_attributes
    {
        # Test avatar next
      :avatar_file_name => "willy_fb_profile.jpg",
      :avatar_content_type => "image/jpeg",
      :avatar_file_size => "38103",
      :avatar_file_name => fixture_file_upload('spec/fixtures/willy_fb_profile.jpg', 'image/jpeg')
    }
  end

  it "should accept valid avatar" do
    @avatar_attr = { :avatar_file_name => Rack::Test::UploadedFile.new('spec/fixtures/willy_fb_profile.jpg', 'image/jpeg') }
  end


  it "should be valid avatar" do
    @avatar_attr = { :avatar => File.join(Rails.root, 'spec', 'fixtures', 'file.jpeg') }
    # :avatar_file_name = File.new(Rails.root + 'spec/fixtures/images/willy_fb_profil.jpg')
  end


  it "should create a new instance given a valid attribute" do
    User.create!(@login_attr)
  end

  it "should require an email address" do
    no_email_user = User.new(@login_attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@login_attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@login_attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@login_attr)
    user_with_duplicate_email = User.new(@login_attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @login_attr[:email].upcase
    User.create!(@login_attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@login_attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "passwords" do

    before(:each) do
      @user = User.new(@login_attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@login_attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@login_attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @login_attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@login_attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end

end