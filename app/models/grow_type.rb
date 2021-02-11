# == Schema Information
#
# Table name: grow_types
#
#  id         :bigint           not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GrowType < ApplicationRecord
  has_many :monsters

  TYPES = [
    '早熟', '普通', '持続', '晩成',
  ]

  validates :title, presence: true
  validates :title, inclusion: { in: TYPES }
end
