class CreateJoinTableMonsterCondition < ActiveRecord::Migration[6.0]
  def change
    create_join_table :monsters, :conditions do |t|
      t.index [:monster_id, :condition_id]
      t.index [:condition_id, :monster_id]
    end
  end
end
