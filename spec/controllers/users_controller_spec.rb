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

describe UsersController do

    describe "GET 'show' " do
      before do
        get :show
      end

     it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      # it "should give the statuses in an instance variable in reverse order" do
      #   expect(assigns(:statuses)).to be
      #   expect(assigns(:statuses).first.class).to eq(Status)
      #   # expect(assigns(:statuses).first.name).to eq("Fruit number 2")
      # end
    end

  end