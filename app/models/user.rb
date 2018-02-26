# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  dob        :date
#  gender     :integer
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  enum gender: { male: 0, female: 1 }

  validates_uniqueness_of :email, message: 'There is already a patient registered with this email address'
  validates_presence_of :first_name, :last_name, :dob, :gender, :email

  has_many :appointments

  def full_name
    first_name + ' ' + last_name
  end



end
