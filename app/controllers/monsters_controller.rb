class MonstersController < ApplicationController

  def index
    @monsters = Monster.includes(
      :conditions,
      :parameter,
      :main_family_type,
      :sub_family_type,
      :grow_type,
    )
    .where(family_types: { name: 'ピクシー' })
  end

end
