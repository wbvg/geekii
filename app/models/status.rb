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

class Status < ActiveRecord::Base
  attr_accessible :user_id, :category, :status, :need_help

  validates :category, :presence => true, length: { maximum: 40, message: "Must be less than 40 characters" },
                            format:  {
                            with: /[a-zA-Z0-9_]/,
                            message: "Must be formatted correctly."
                          }

  validates :status, :presence => true, length: { maximum: 200, message: "Must be less than 200 characters" },
                            format:  {
                            with: /[a-zA-Z0-9_]/,
                            message: "Must be formatted correctly."
                          }

validates_inclusion_of :need_help, :in => [true, false]

delegate :username, :to => :user

  belongs_to :user

  def user_avatar
    user.avatar if user
  end

  def Status.chronological
    Status.order("created_at desc")
  end


  # for the will_paginate
  self.per_page = 4


end



