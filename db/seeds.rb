# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u3 = User.create(:email => 'larry@gmail.com', :password => '123456', :password_confirmation => '123456', :occupation => "UX | UI Designer",   :location => "Sydney", :avatar_file_name => "willy_fb_profile.jpg", :avatar_content_type => "image/jpeg", :avatar_file_size => "38103", :username => "larry")



er1 = Profile.create(:label => 'Javascript', :value => 100, :chapter => 'Junior Dev', :user_id => 5)
er2 = Profile.create(:label => 'Web Design', :value => 100, :chapter => 'Junior Dev', :user_id => 5)


u3.profiles << [er1, er2]

u3.save