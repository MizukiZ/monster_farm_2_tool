class Monster < ApplicationRecord
  has_and_belongs_to_many :conditions
  has_one :parameter, dependent: :destroy
  belongs_to :main_family_type, foreign_key: 'main_family_type_id', class_name: 'FamilyType'
  belongs_to :sub_family_type, foreign_key: 'sub_family_type_id', class_name: 'FamilyType', optional: true
  belongs_to :grow_type, optional: true

  include NumberToRank

  default_scope { includes(:conditions, :parameter, :main_family_type, :sub_family_type, :grow_type) }

  delegate :name, to: :main_family_type, prefix: true
  delegate :name, to: :sub_family_type, prefix: true, allow_nil: true
  delegate :title, to: :grow_type, prefix: true, allow_nil: true

  def conditions_csv
    conditions.pluck(:title).join(', ')
  end
end
