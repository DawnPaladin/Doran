class CreateSynergies < ActiveRecord::Migration[5.0]
  def change
    create_table :synergies do |t|
      t.string :name

      t.timestamps
    end
  end
end
