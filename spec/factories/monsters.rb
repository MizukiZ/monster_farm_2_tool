FactoryBot.define do
  factory :monster do
    name { 'test monster' }
    association :main_family_type, factory: [:family_type, :dragon]
    association :sub_family_type, factory: [:family_type, :tiger]
    association :grow_type
    character { -30 }
    moving_speed { 2 }
    guts_speed { 12 }
    life_span { 350 }
  end
end
