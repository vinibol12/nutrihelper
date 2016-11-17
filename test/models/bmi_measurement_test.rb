# == Schema Information
#
# Table name: bmi_measurements
#
#  id                           :integer          not null, primary key
#  anthropometric_evaluation_id :integer          not null
#  weight                       :float
#  height                       :integer
#  bmi                          :float
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

require 'test_helper'

class BmiMeasurementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
