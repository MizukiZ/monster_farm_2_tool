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
require 'rails_helper'

RSpec.describe Monster, type: :model do
  it 'is valid with valid attributes'
  it 'is not valid without a name'
  it 'is not valid with non number character'
  it 'is not valid with non number moving_speed'
  it 'is not valid with negative number moving_speed'
  it 'is not valid with non number guts_speed'
  it 'is not valid with negative number guts_speed'
  it 'is not valid with non number life_span'
  it 'is not valid with negative number life_span'
end
