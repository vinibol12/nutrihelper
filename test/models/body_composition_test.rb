# == Schema Information
#
# Table name: body_compositions
#
#  id                         :integer          not null, primary key
#  atropometric_evaluation_id :integer          not null
#  fat_percentage             :decimal(, )
#  fat_mass                   :float
#  lean_mass                  :float
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require 'test_helper'

class BodyCompositionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
