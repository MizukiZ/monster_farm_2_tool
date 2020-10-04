class MonsterSearchController < ApplicationController

  def index
    @monsters = Monster.all

    @monsters = @monsters.where("monsters.name iLike '%#{params[:name]}%'") if params[:name].present?
    @monsters = @monsters.where(main_family_type_id: params[:main_type]) if params[:main_type].present?
    @monsters = @monsters.where(sub_family_type_id: params[:sub_type]) if params[:sub_type].present?

    @monsters = @monsters.where(parameters: { life_apptitude: params[:life_apptitude] }) if params[:life_apptitude].present?
    @monsters = @monsters.where(parameters: { power_apptitude: params[:power_apptitude] }) if params[:power_apptitude].present?
    @monsters = @monsters.where(parameters: { intelligence_apptitude: params[:intelligence_apptitude] }) if params[:intelligence_apptitude].present?
    @monsters = @monsters.where(parameters: { accuracy_apptitude: params[:accuracy_apptitude] }) if params[:accuracy_apptitude].present?
    @monsters = @monsters.where(parameters: { avoidance_apptitude: params[:avoidance_apptitude] }) if params[:avoidance_apptitude].present?
    @monsters = @monsters.where(parameters: { defence_apptitude: params[:defence_apptitude] }) if params[:defence_apptitude].present?

    @monsters = @monsters.where(grow_type: params[:grow_type]) if params[:grow_type].present?
    @monsters = @monsters.where(moving_speed: params[:moving_speed]) if params[:moving_speed].present?

    @monsters = @monsters.where(life_span: params[:life_span].first..params[:life_span].last) if params[:life_span].present?
    @monsters = @monsters.where(character: params[:character].first..params[:character].last) if params[:character].present?
    @monsters = @monsters.where(guts_speed: params[:guts_speed].first..params[:guts_speed].last) if params[:guts_speed].present?

    if params[:conditions].present? #TODO this method needs to be improved
      monster_ids = nil
      params[:conditions].each_with_index do |condition_id, i|
        if i == 0
          monster_ids = Monster.where(conditions: { id: condition_id }).pluck(:id)
        else
          monster_ids &= Monster.where(conditions: { id: condition_id }).pluck(:id)
        end
      end

      @monsters = @monsters.where(id: monster_ids)
    end

  end
end
