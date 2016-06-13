class AddParticipantsCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :participants_count, :integer, default: 0
  end
end
