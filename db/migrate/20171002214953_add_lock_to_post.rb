class AddLockToPost < ActiveRecord::Migration[5.0]
  def change
   add_column :posts, :lock_version, :integer, default: 0
	end
end
