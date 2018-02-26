# == Schema Information
#
# Table name: anthropometric_evaluations
#
#  id             :integer          not null, primary key
#  appointment_id :integer          not null
#  fat_percentage :decimal(5, 2)
#  fat_mass       :decimal(5, 2)
#  lean_mass      :decimal(5, 2)
#  abdomen        :decimal(5, 2)
#  waist          :decimal(5, 2)
#  hip            :decimal(5, 2)
#  arm            :decimal(5, 2)
#  weight         :decimal(6, 3)
#  height         :decimal(6, 3)
#  bmi            :decimal(6, 3)
#  triceps        :decimal(5, 2)
#  subscapular    :decimal(5, 2)
#  thigh          :decimal(5, 2)
#  iliac_crest    :decimal(5, 2)
#  abdominal      :decimal(5, 2)
#  chest          :decimal(5, 2)
#  axilla         :decimal(5, 2)
#  calf           :decimal(5, 2)
#  biceps         :decimal(5, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AnthropometricEvaluation < ApplicationRecord
  belongs_to :appointment
  has_one :bmi_measurement
  has_one :body_composition
  has_one :circumference_measurement
  has_one :skin_fold_measurement

  validates_presence_of :fat_percentage, :fat_mass, :lean_mass, :abdomen, :waist, :hip, :arm, :weight, :height,
                        :bmi, :triceps, :subscapular, :thigh, :iliac_crest, :abdominal, :chest, :axilla, :calf,
                        :biceps



end
