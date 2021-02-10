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
