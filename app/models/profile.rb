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
  validates :user_id, presence: true


  validates :chapter, :presence => true, length: { maximum: 40, message: "Must be less than 40 characters" },
                            format:  {
                            with: /[a-zA-Z0-9_]/,
                            message: "Must be formatted correctly."
                          }

  validates :label, :presence => true, length: { maximum: 30, message: "Must be less than 30 characters" },
                          format:  {
                          with: /[a-zA-Z0-9_]/,
                          message: "Must be formatted correctly.",
                        }

  validates :value, :presence => true, length: { maximum: 40, message: "Must be less than 40 characters" },
                            format:  {
                            with: /[0-9]/,
                            message: "Must be a number value less than 100."
                          },
                         :numericality => {
                          :greater_than => 0,
                          :less_than => 101,
                          message: "Must be a number between 1 - 100." }

 belongs_to :user, :inverse_of => :profiles
   delegate :username, :to => :user

  def Profile.chronological
    Profile.order("created_at desc")
  end

  # for the will_paginate
  self.per_page = 4

end

