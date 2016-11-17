# == Schema Information
#
# Table name: circumference_measurements
#
#  id                           :integer          not null, primary key
#  anthropometric_evaluation_id :integer          not null
#  abdomen                      :integer
#  waist                        :integer
#  hip                          :integer
#  arm                          :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

require 'test_helper'

class CircumferenceMeasurementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
