class MonstersController < ApplicationController

  def index
    @monsters = FamilyType.find(params[:family_type_id]).monsters_as_main
  end

end
