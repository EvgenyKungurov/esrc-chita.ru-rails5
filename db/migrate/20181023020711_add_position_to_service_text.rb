class AddPositionToServiceText < ActiveRecord::Migration[5.0]
  def change
    add_column :servicetexts, :position, :integer
  end
end
