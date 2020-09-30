class FamilyTypesController < ApplicationController
  
  def index
    @family_types = FamilyType.all
  end
end
