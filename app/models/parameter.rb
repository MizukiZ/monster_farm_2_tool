class Parameter < ApplicationRecord
  belongs_to :monster
  include NumberToRank
end
