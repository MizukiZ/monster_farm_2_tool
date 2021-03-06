# == Schema Information
#
# Table name: monsters
#
#  id                  :bigint           not null, primary key
#  name                :text
#  main_family_type_id :bigint
#  sub_family_type_id  :bigint
#  grow_type_id        :bigint
#  character           :integer
#  moving_speed        :integer
#  guts_speed          :integer
#  life_span           :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Monster < ApplicationRecord
  # paginates_per 30
  include NumberToRank

  has_and_belongs_to_many :conditions
  has_one :parameter, dependent: :destroy
  belongs_to :main_family_type, foreign_key: 'main_family_type_id', class_name: 'FamilyType'
  belongs_to :sub_family_type, foreign_key: 'sub_family_type_id', class_name: 'FamilyType', optional: true
  belongs_to :grow_type, optional: true

  default_scope { includes(:conditions, :parameter, :main_family_type, :sub_family_type, :grow_type) }

  validates :name, presence: true
  validates :character, numericality: true
  validates :moving_speed, :guts_speed, :life_span, numericality: { greater_than_or_equal_to: 0 }

  delegate :name, to: :main_family_type, prefix: true
  delegate :name, to: :sub_family_type, prefix: true, allow_nil: true
  delegate :title, to: :grow_type, prefix: true, allow_nil: true

  def conditions_csv
    conditions.pluck(:title).join(', ')
  end
end
