require 'csv'
dependencies_creation = false

if dependencies_creation
  # Create family types
  FamilyType::TYPES.each do |type|
    FamilyType.create(name: type)
  end

  # Create conditions
  Condition::TYPES.each do |type|
    Condition.create(title: type)
  end

  # Create grow types
  GrowType::TYPES.each do |type|
    GrowType.create(title: type)
  end
end

def create_monster(monster_data)
  main_type = FamilyType.find_by_name(monster_data[:relation_data][:main_type])
  sub_type = FamilyType.find_by_name(monster_data[:relation_data][:sub_type])
  grow_type = GrowType.find_by_title(monster_data[:relation_data][:grow_type])

  new_monster = Monster.create(monster_data[:basic_data])
  new_monster.update(
    main_family_type: main_type,
    sub_family_type: sub_type,
    grow_type: grow_type,
  )

  conditions = Condition.where(title: monster_data[:relation_data][:conditions])
  new_monster.conditions = conditions

  Parameter.create(monster_data[:parameter_data].merge(monster: new_monster))
end

# Create monsters
number_to_alpha = { E: 1, D: 2, C: 3, B: 4, A: 5 }
FamilyType::TYPES.each do |type|
  monster_csv_file = File.read(Rails.root.join('lib', 'seeds', "#{type}_data.csv"))
  csv = CSV.parse(monster_csv_file, headers: true, encoding: 'ISO-8859-1')
  csv.each do |row|
    main_type, sub_type = row['family']&.split('×')
    life_a, power_a, intelligence_a, accuracy_a, avoidance_a, defence_a = row['apptitude']&.split('')&.map { |a| number_to_alpha[a.to_sym] }

    monster_data = {
        relation_data: {
          main_type: main_type,
          sub_type: sub_type,
          grow_type: row['grow_type'],
          conditions: row['conditions']&.split(','),
        },
        basic_data: {
          name: row['name'],
          character: row['character'],
          moving_speed: row['moving_speed'],
          guts_speed: row['guts_speed'],
          life_span: row['life_span'],
        },
        parameter_data: {
          life: row['life'], life_apptitude: life_a,
          power: row['power'], power_apptitude: power_a,
          intelligence: row['intelligence'], intelligence_apptitude: intelligence_a,
          accuracy: row['accuracy'], accuracy_apptitude: accuracy_a,
          avoidance: row['avoidance'], avoidance_apptitude: avoidance_a,
          defence: row['defence'], defence_apptitude: defence_a,
        }
      }

    create_monster(monster_data)
  end
end
