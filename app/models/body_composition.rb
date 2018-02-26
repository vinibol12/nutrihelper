# == Schema Information
#
# Table name: body_compositions
#
#  id                         :integer          not null, primary key
#  anthropometric_evaluation_id :integer          not null
#  fat_percentage             :decimal(, )
#  fat_mass                   :float
#  lean_mass                  :float
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class BodyComposition < ApplicationRecord
  belongs_to :anthropometric_evaluation
end
