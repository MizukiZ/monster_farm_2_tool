class MonstersController < ApplicationController

  def index
    @monsters = Monster.all
    @monsters = @monsters.where(family_types: { name: params[:family_type] }) if params[:family_type].present?

    if @monsters.any?
      # index.json.jbuilder
    else
      head :no_content
    end
  end

end
