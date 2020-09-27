class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.text :name
      t.references :main_family_type_id, index: true, foreign_key: { to_table: :family_types }
      t.references :sub_family_type_id, index: true, foreign_key: { to_table: :family_types }
      t.references :grow_type
      t.integer :character
      t.integer :moving_speed
      t.integer :guts_speed
      t.integer :life_span
      t.timestamps
    end
  end
end
