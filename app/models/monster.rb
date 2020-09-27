class Monster < ApplicationRecord
  has_and_belongs_to_many :conditions
  belongs_to :main_family_type, foreign_key: 'main_family_type_id', class_name: 'FamilyType'
  belongs_to :sub_family_type, foreign_key: 'sub_family_type_id', class_name: 'FamilyType'
end