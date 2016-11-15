class User < ApplicationRecord

  enum gender: { male: 0, female: 1 }

  has_many :appointments

  def full_name
    first_name + ' ' + last_name
  end

end
