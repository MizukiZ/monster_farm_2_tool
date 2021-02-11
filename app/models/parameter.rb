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
class Parameter < ApplicationRecord
  belongs_to :monster
  include NumberToRank

  validates :life, :life_apptitude, :life_apptitude_index,
  :power, :power_apptitude, :power_apptitude_index,
  :intelligence, :intelligence_apptitude, :intelligence_apptitude_index,
  :accuracy, :accuracy_apptitude, :accuracy_apptitude_index,
  :avoidance, :avoidance_apptitude, :avoidance_apptitude_index,
  :defence, :defence_apptitude, :defence_apptitude_index,
  numericality: { greater_than_or_equal_to: 0 }
end
