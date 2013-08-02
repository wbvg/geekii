class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  attr_accessible :first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :remember_me

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format:  {
                            with: /[a-zA-Z0-9_]/,
                            message: "Must be formatted correctly."
                           }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :title, :body

  has_many :statuses

  def full_name
  	first_name + " " + last_name
  end
end
