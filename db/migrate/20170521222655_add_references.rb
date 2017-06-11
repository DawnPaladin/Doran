class AddReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :roster, foreign_key: true
    add_reference :rosters, :user, foreign_key: true
    add_reference :positions, :roster, foreign_key: true
    add_reference :strengths, :champion, foreign_key: true
    add_reference :strengths, :user, foreign_key: true
    add_reference :weaknesses, :champion, foreign_key: true
    add_reference :weaknesses, :user, foreign_key: true
    add_reference :synergies, :champion, foreign_key: true
    add_column :synergies, :synergizes_with_id, :integer
    add_reference :synergies, :user, foreign_key: true
    add_reference :counters, :champion, foreign_key: true
    add_column :counters, :counters_id, :integer
    add_reference :counters, :user, foreign_key: true
  end
end
