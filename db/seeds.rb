# Create family types
FamilyType::TYPES.each do |type|
  FamilyType.create(name: type)
end

# Create conditions
Condition::TYPES.each do |type|
  Condition.create(title: type)
end

