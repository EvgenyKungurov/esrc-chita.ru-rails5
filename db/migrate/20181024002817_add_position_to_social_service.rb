class AddPositionToSocialService < ActiveRecord::Migration[5.0]
  def change
    add_column :social_services, :position, :integer
  end
end
