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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  attr_accessible :username, :location, :occupation, :email, :password, :password_confirmation, :remember_me

  validates :occupation, presence: true
  validates :location, presence: true
  validates :username, presence: true,
                           uniqueness: true,
                           format:  {
                            with: /[a-zA-Z0-9_]/,
                            message: "Must be formatted correctly."
                           }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :title, :body

  has_many :statuses, :dependent => :destroy
  has_many :skills, :dependent => :destroy

#Paperclip avatar
  attr_accessible :avatar, :avatar_file_name, :avatar_content_type, :avatar_file_size
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates :avatar, presence: true

  delegate :avatar , :to => :user, :prefix => true, :allow_nil => true

  def user_avatar
    user.avatar if user
  end

end




