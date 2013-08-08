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

  validates :category, :presence => true
  validates :status, :presence => true
  belongs_to :user

  validates_length_of :status, :maximum => 254,
      :too_long => "{{count}} characters is the maximum allowed"

  def user_avatar
    user.avatar if user
  end

  def Status.chronological
    Status.order("created_at desc")
  end


  # for the will_paginate
  self.per_page = 4


end



