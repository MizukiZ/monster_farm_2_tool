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
  before do
    @type_dragon = FactoryBot.create(:family_type, :dragon)
    @type_tiger = FactoryBot.create(:family_type, :tiger)
    @grow_type = FactoryBot.create(:grow_type)
  end

  subject {
    described_class.new(
      name: 'test monster',
      main_family_type_id: @type_dragon.id,
      sub_family_type_id: @type_tiger.id,
      grow_type_id: @grow_type.id,
      character: -30,
      moving_speed: 2,
      guts_speed: 12,
      life_span: 350,
    )
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid with non number character' do
    subject.character = 'non_number'
    expect(subject).to_not be_valid
  end
  it 'is not valid with non number moving_speed' do
    subject.moving_speed = 'non_number'
    expect(subject).to_not be_valid
  end
  it 'is not valid with negative number moving_speed' do
    subject.moving_speed = -100
    expect(subject).to_not be_valid
  end
  it 'is not valid with non number guts_speed' do
    subject.guts_speed = 'non_number'
    expect(subject).to_not be_valid
  end
  it 'is not valid with negative number guts_speed' do
    subject.guts_speed = -100
    expect(subject).to_not be_valid
  end
  it 'is not valid with non number life_span' do
    subject.life_span = 'non_number'
    expect(subject).to_not be_valid
  end
  it 'is not valid with negative number life_span' do
    subject.life_span = -100
    expect(subject).to_not be_valid
  end
end
