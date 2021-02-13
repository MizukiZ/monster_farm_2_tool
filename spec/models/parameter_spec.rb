# == Schema Information
#
# Table name: parameters
#
#  id                           :bigint           not null, primary key
#  life                         :integer
#  life_apptitude               :integer
#  life_apptitude_index         :integer
#  power                        :integer
#  power_apptitude              :integer
#  power_apptitude_index        :integer
#  intelligence                 :integer
#  intelligence_apptitude       :integer
#  intelligence_apptitude_index :integer
#  accuracy                     :integer
#  accuracy_apptitude           :integer
#  accuracy_apptitude_index     :integer
#  avoidance                    :integer
#  avoidance_apptitude          :integer
#  avoidance_apptitude_index    :integer
#  defence                      :integer
#  defence_apptitude            :integer
#  defence_apptitude_index      :integer
#  monster_id                   :bigint
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
require 'rails_helper'

RSpec.describe Parameter, type: :model do
  before do
    @monster = FactoryBot.create(:monster)
  end

  subject {
    @monster.build_parameter(
      life: 100,
      life_apptitude: 3,
      life_apptitude_index: 5,
      power: 170,
      power_apptitude: 5,
      power_apptitude_index: 1,
      intelligence: 160,
      intelligence_apptitude: 5,
      intelligence_apptitude_index: 2,
      accuracy: 120,
      accuracy_apptitude: 3,
      accuracy_apptitude_index: 3,
      avoidance: 90,
      avoidance_apptitude: 2,
      avoidance_apptitude_index: 6,
      defence: 110,
      defence_apptitude: 3,
      defence_apptitude_index: 4,
    )
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  numericality_check_columns = [
    :life, :life_apptitude, :life_apptitude_index,
    :power, :power_apptitude, :power_apptitude_index,
    :intelligence, :intelligence_apptitude, :intelligence_apptitude_index,
    :accuracy, :accuracy_apptitude, :accuracy_apptitude_index,
    :avoidance, :avoidance_apptitude, :avoidance_apptitude_index,
    :defence, :defence_apptitude, :defence_apptitude_index
  ]

  numericality_check_columns.each do |ncc|
    it "is not valid without non number #{ncc}" do
      subject.public_send("#{ncc}=", 'non_number')
      expect(subject).to_not be_valid
    end
  end
end
