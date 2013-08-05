#  id                     :integer          not null, primary key
#  username               :string(255)
#  location               :text
#  occupation             :string(255)
#  email                  :string(255)      default(""), not null


FactoryGirl.define do
  factory :user do
    username 'Willy'
    location 'Sydney'
    occupation 'UX | UI Designer'
    email 'willy@Willy.com'
    password '123456'
    password_confirmation '123456'
    avatar_file_name 'willy_fb_profile.jpg'
    avatar_content_type 'image/jpeg'
    avatar_file_size '38103'

    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end