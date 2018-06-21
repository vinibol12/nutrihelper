# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date_time  :datetime
#  notes      :string
#

class Appointment < ApplicationRecord
  belongs_to :user
  has_one :anthropometric_evaluation

  validates_presence_of :date_time

end
