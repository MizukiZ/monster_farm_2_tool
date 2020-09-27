class FamilyType < ApplicationRecord
  has_many :monsters_as_main, foreign_key: "main_family_type_id", class_name: "Monster"
  has_many :monsters_as_sub, foreign_key: "sub_family_type_id", class_name: "Monster"
end
