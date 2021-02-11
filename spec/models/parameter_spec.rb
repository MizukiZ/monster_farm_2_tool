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
  pending "add some examples to (or delete) #{__FILE__}"
end
