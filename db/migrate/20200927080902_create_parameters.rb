class CreateParameters < ActiveRecord::Migration[6.0]
  def change
    create_table :parameters do |t|
      t.integer :life
      t.integer :life_apptitude
      t.integer :life_apptitude_index
      t.integer :power
      t.integer :power_apptitude
      t.integer :power_apptitude_index
      t.integer :intelligence
      t.integer :intelligence_apptitude
      t.integer :intelligence_apptitude_index
      t.integer :accuracy
      t.integer :accuracy_apptitude
      t.integer :accuracy_apptitude_index
      t.integer :avoidance
      t.integer :avoidance_apptitude
      t.integer :avoidance_apptitude_index
      t.integer :defence
      t.integer :defence_apptitude
      t.integer :defence_apptitude_index
      t.references :monster
      t.timestamps
    end
  end
end
