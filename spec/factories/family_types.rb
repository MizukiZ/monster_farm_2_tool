# == Schema Information
#
# Table name: family_types
#
#  id         :bigint           not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :family_type_dragon, class: FamilyType do
    name {'ドラゴン'}
  end

  factory :family_type_tiger, class: FamilyType do
    name {'ライガー'}
  end
end
