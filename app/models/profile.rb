# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  chapter    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label      :string(255)
#  value      :integer
#

class Profile < ActiveRecord::Base

  attr_accessible :user_id, :chapter, :label, :value
  has_many :user, :inverse_of => :profiles
  validates :chapter, :label, :value, :user_id, presence: true,
  length: { maximum: 40, message: "Must be less than 40 characters" },
                            format:  {
                            with: /[a-zA-Z0-9_]/,
                            message: "Must be formatted correctly."
                          }



  validates_length_of :chapter, :label, :maximum => 254,
      :too_long => "{{count}} characters is the maximum allowed"

  def Profile.chronological
    Profile.order("created_at desc")
  end

  # for the will_paginate
  self.per_page = 2

end

