# User.destroy_all
# Profile.destroy_all
# Status.destroy_all

u1 = User.create(:email => 'willy@gmail.com', :password => '123456', :password_confirmation => '123456', :occupation => "UX | UI Designer",   :location => "Sydney", :username => "willy")

u2 = User.create(:email => 'missy@gmail.com', :password => '123456', :password_confirmation => '123456', :occupation => "UX | UI Designer",   :location => "Sydney", :username => "missy")


s1 = Status.create(:category => "UX | UI Designer", :status => "Hi I need help", :need_help => true)
s2 = Status.create(:category => "Web Developer", :status => "Hi I need help with a Joomla Developer", :need_help => true)
s3 = Status.create(:category => "Back-End Developer", :status => "Hi I need help", :need_help => false)
s4 = Status.create(:category => "UX | UI Designer", :status => "Hi I need help with UX website links", :need_help => false)
s5 = Status.create(:category => "Back-End Developer", :status => "Hi I need help", :need_help => false)
s6 = Status.create(:category => "Jack of All Trades", :status => "Hi I am looking to partner in Sydney area", :need_help => true)

u1.statuses << s1
u1.statuses << s2
u1.statuses << s3
u2.statuses << s4
u2.statuses << s5
u2.statuses << s6

p1 = Profile.create(:label => 'Javascript', :value => 100, :chapter => 'Junior Dev')
p2 = Profile.create(:label => 'Web Design', :value => 100, :chapter => 'Junior Dev')
p3 = Profile.create(:label => 'JQuery', :value => 100, :chapter => 'General Assembly')
p4 = Profile.create(:label => 'Web Design', :value => 100, :chapter => 'General Assembly')
p5 = Profile.create(:label => 'Mobile UX', :value => 100, :chapter => 'Sydney Web Designer')
p6 = Profile.create(:label => 'Axure Wireframing', :value => 100, :chapter => 'Sydney Web Designer')
p7 = Profile.create(:label => 'Prototyping', :value => 70, :chapter => 'Sydney Web Designer')

u1.profiles << [p5,p6,p7]
u2.profiles << [p1,p2,p3,p4]

u1.save
u2.save


