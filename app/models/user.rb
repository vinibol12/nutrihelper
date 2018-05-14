# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  date_of_birth          :date
#  gender                 :integer
#  email                  :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  roles                  :text             default([]), is an Array
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: { male: 0, female: 1 }

  validates_uniqueness_of :email, message: 'There is already a patient registered with this email address'
  validates_presence_of :first_name, :last_name, :date_of_birth, :gender, :email, :encrypted_password

  has_many :appointments

  def full_name
    first_name + ' ' + last_name
  end

  def admin?
    roles.include? 'admin'
  end

end
