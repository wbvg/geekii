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

  validates :category, presence: true
  validates :status, presence: true
  validates :need_help, presence: true
  belongs_to :user

  validates_length_of :status, :maximum => 254,
      :too_long => "{{count}} characters is the maximum allowed"

end
