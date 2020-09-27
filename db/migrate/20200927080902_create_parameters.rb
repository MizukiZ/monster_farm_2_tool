class CreateParameters < ActiveRecord::Migration[6.0]
  def change
    create_table :parameters do |t|
      t.integer :life
      t.integer :life_apptitude
      t.integer :power
      t.integer :power_apptitude
      t.integer :intelligence
      t.integer :intelligence_apptitude
      t.integer :accuracy
      t.integer :accuracy_apptitude
      t.integer :avoidance
      t.integer :avoidance_apptitude
      t.integer :defence
      t.integer :defence_apptitude
      t.timestamps
    end
  end
end
