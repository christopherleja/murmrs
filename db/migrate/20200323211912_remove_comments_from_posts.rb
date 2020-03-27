class RemoveCommentsFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :comments, :datatype
  end
end
