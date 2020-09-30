json.monsters @monsters do |monster|
  json.no monster.id
  json.name monster.name
  json.main_type monster.main_family_type_name
  json.sub_type monster.sub_family_type_name || '???'
  json.grow_type monster.grow_type_title
  json.conditions monster.conditions_csv
  json.character monster.character
  json.moving_speed monster.moving_speed
  json.guts_speed monster.guts_speed
  json.life_span monster.life_span

  json.parameters do
    monster.parameter.attribute_names.each do |attr_name|
      next if ['monster_id', 'id'].include?(attr_name)
      json.set! attr_name, monster.parameter.public_send(attr_name)
    end
  end
end
