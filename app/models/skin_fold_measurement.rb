# == Schema Information
#
# Table name: skin_fold_measurements
#
#  id                           :integer          not null, primary key
#  anthropometric_evaluation_id :integer          not null
#  triceps                      :integer
#  subscapular                  :integer
#  thigh                        :integer
#  iliac_crest                  :integer
#  abdominal                    :integer
#  chest                        :integer
#  axilla                       :integer
#  calf                         :integer
#  biceps                       :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class SkinFoldMeasurement < ApplicationRecord
  belongs_to :anthropometric_evaluation
end
