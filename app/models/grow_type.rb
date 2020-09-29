class GrowType < ApplicationRecord
  has_many :monsters

  TYPES = [
    '早熟', '普通', '持続', '晩成',
  ]
end
