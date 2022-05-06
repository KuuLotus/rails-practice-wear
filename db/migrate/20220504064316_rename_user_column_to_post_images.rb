class RenameUserColumnToPostImages < ActiveRecord::Migration[6.1]
  def change
    rename_column :post_images, :user, :user_id
  end
end
