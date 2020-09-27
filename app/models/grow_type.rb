class GrowType < ApplicationRecord
  has_many :monsters

  TYPES = [
    '早熟', '普通', '特続', '晩成',
  ]
end
