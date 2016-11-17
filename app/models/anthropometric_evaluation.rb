# == Schema Information
#
# Table name: anthropometric_evaluations
#
#  id             :integer          not null, primary key
#  appointment_id :integer          not null
#  patient_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AnthropometricEvaluation < ApplicationRecord
  # has_one :circumference_measurement
  # has_one :skin_fold_measurement
  # has_one :bmi_measurement
  # has_one :body_composition
  # has_one :patient, class: User


end
