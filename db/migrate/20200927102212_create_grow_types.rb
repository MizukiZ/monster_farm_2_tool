class CreateGrowTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :grow_types do |t|
      t.text :title
      t.timestamps
    end
  end
end
