class GrowType < ApplicationRecord
  has_many :monsters

  TYPES = [
    '早熟', '普通', '持続', '晩成',
  ]

  validates :title, presence: true
  validates :title, inclusion: { in: TYPES }
end
