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
  factory :family_type do
    name {'ピクシー'}
    
    trait :dragon do
      name {'ドラゴン'}
    end
    trait :tiger do
      name {'ライガー'}
    end
  end
end
