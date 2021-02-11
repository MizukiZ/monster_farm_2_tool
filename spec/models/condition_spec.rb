# == Schema Information
#
# Table name: conditions
#
#  id         :bigint           not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Condition, type: :model do
  subject {
    described_class.new(title: '底力')
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without accepted name" do
    subject.title = '???'
    expect(subject).to_not be_valid
  end
end
