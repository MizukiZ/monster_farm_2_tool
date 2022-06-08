# == Schema Information
#
# Table name: family_types
#
#  id         :bigint           not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe FamilyType, type: :model do
  subject {
    described_class.new(name: 'ドラゴン')
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without accepted name" do
    subject.name = '???'
    expect(subject).to_not be_valid
  end
end
