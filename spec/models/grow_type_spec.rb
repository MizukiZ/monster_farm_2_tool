require 'rails_helper'

RSpec.describe GrowType, type: :model do
  subject {
    described_class.new(title: '普通')
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without accepted title" do
    subject.title = '???'
    expect(subject).to_not be_valid
  end
end
