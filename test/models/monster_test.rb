# == Schema Information
#
# Table name: monsters
#
#  id                  :bigint           not null, primary key
#  name                :text
#  main_family_type_id :bigint
#  sub_family_type_id  :bigint
#  grow_type_id        :bigint
#  character           :integer
#  moving_speed        :integer
#  guts_speed          :integer
#  life_span           :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'test_helper'

class MonsterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
