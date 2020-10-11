class BestMatchesController < ApplicationController

  def index
    base_monster_parameters_order = Monster
    .find_by(id: params[:monster_id])
    .parameter
    .attributes
    .slice('life_apptitude_index', 'power_apptitude_index', 'intelligence_apptitude_index', 'accuracy_apptitude_index', 'avoidance_apptitude_index', 'defence_apptitude_index')
    .sort_by { |k, v| v }
    .to_h
    .keys
    .map { |k| k.gsub('_index', '') }

    parameter_apptitudes = Parameter.select(:life_apptitude, :power_apptitude, :intelligence_apptitude, :accuracy_apptitude, :avoidance_apptitude, :defence_apptitude, :monster_id).all
    matched_monster_ids = []

    parameter_apptitudes.each do |parameter_apptitude|
      result = false
      monster_id = parameter_apptitude['monster_id']
      parameter_apptitude = parameter_apptitude.attributes.except('id', 'monster_id')

      # first step to find the best apptitude
      highest_apptitude = find_best_apptitude(parameter_apptitude, base_monster_parameters_order.first)
      next unless highest_apptitude

      current_apptitude = highest_apptitude
      loop.with_index do |_, i|
        i += 1 # start from 2nd item
        current_apptitude = check_next_apptitude(parameter_apptitude, current_apptitude, base_monster_parameters_order[i])
        break unless current_apptitude

        if i == 5 # mutch all apptitude
          result = true
          break
        end
      end

      matched_monster_ids << monster_id if result
    end

    @monsters = Monster.where(id: matched_monster_ids)
  end

  private
    def find_best_apptitude(parameter_apptitude, parameter)
      highest_apptitude = parameter_apptitude.values.max
      best_paramters = parameter_apptitude.select { |k, v| v == highest_apptitude }
      best_paramters.keys.include?(parameter) ? highest_apptitude : nil
    end

    def check_next_apptitude(parameter_apptitude, prev_apptitude, parameter)
      apptitude = parameter_apptitude[parameter]
      apptitude <= prev_apptitude ? apptitude : nil
    end
end
