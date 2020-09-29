json.monsters @monsters do |monster|
  json.no monster.id
  json.name monster.name
  json.main_type monster.main_family_type&.name
  json.sub_type monster.sub_family_type&.name || '???'
  json.grow_type monster.grow_type&.title
  json.conditions monster.conditions.pluck(:title).join(', ')
  json.character monster.character
  json.moving_speed monster.moving_speed
  json.guts_speed monster.guts_speed
  json.life_span monster.life_span

  json.parameters do
    json.life monster.parameter.life
    json.power monster.parameter.power
    json.intelligence monster.parameter.intelligence
    json.accuracy monster.parameter.accuracy
    json.avoidance monster.parameter.avoidance
    json.defence monster.parameter.defence
    json.life_apptitude monster.parameter.life_apptitude
    json.power_apptitude monster.parameter.power_apptitude
    json.intelligence_apptitude monster.parameter.intelligence_apptitude
    json.accuracy_apptitude monster.parameter.accuracy_apptitude
    json.avoidance_apptitude monster.parameter.avoidance_apptitude
    json.defence_apptitude monster.parameter.defence_apptitude
    json.life_apptitude_index monster.parameter.life_apptitude_index
    json.power_apptitude_index monster.parameter.power_apptitude_index
    json.intelligence_apptitude_index monster.parameter.intelligence_apptitude_index
    json.accuracy_apptitude_index monster.parameter.accuracy_apptitude_index
    json.avoidance_apptitude_index monster.parameter.avoidance_apptitude_index
    json.defence_apptitude_index monster.parameter.defence_apptitude_index
  end
end
