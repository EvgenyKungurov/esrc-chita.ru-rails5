class AddPositionToSocialPost < ActiveRecord::Migration[5.0]
  def change
    add_column :social_posts, :position, :integer
  end
end
