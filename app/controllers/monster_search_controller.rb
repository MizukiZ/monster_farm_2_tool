class MonsterSearchController < ApplicationController

  def index
    basic_search_parameters = [:main_family_type_id, :sub_family_type_id, :grow_type, :moving_speed]
    accuray_search_parameters = [
      :life_apptitude,
      :power_apptitude,
      :intelligence_apptitude,
      :accuracy_apptitude,
      :avoidance_apptitude,
      :defence_apptitude
    ]
    range_search_parameters = [:life_span, :character, :guts_speed]

    @monsters = Monster.all

    @monsters = @monsters.where("monsters.name iLike '%#{params[:name]}%'") if params[:name].present?

    basic_search_parameters.each do |bsp|
      @monsters = @monsters.where(bsp => params[bsp]) if params[bsp].present?
    end

    accuray_search_parameters.each do |asp|
      @monsters = @monsters.where(parameters: { asp => params[asp] }) if params[asp].present?
    end

    range_search_parameters.each do |rsp|
      if params[rsp].present?
        min, max = params[rsp]
        @monsters = @monsters.where(rsp => min..max)
      end
    end

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

    @monsters = @monsters.page(params[:page]).per(15)
  end
end
