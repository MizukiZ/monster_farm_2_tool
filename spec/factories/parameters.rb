FactoryBot.define do
  factory :parameter do
    association :monster
    life { 100 }
    life_apptitude { 3 }
    life_apptitude_index { 5 }
    power { 170 }
    power_apptitude { 5 }
    power_apptitude_index { 1 }
    intelligence { 160 }
    intelligence_apptitude { 5 }
    intelligence_apptitude_index { 2 }
    accuracy { 120 }
    accuracy_apptitude { 3 }
    accuracy_apptitude_index { 3 }
    avoidance { 90 }
    avoidance_apptitude { 2 }
    avoidance_apptitude_index { 6 }
    defence { 110 }
    defence_apptitude { 3 }
    defence_apptitude_index { 4 }
  end
end
