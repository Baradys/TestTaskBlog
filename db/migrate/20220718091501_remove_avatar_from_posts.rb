class RemoveAvatarFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :avatar, :string
  end
end
