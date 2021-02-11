# == Schema Information
#
# Table name: conditions
#
#  id         :bigint           not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Condition < ApplicationRecord
  has_and_belongs_to_many :monsters

  TYPES = [
    '底力', '逆上', '根性',
    '集中', '闘魂', '憤怒',
    '我慢', '余裕', '必死',
    '元気', '本気', '泥酔',
    '団結',
  ]
end
