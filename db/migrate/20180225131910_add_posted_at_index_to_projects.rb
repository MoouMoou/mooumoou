class AddPostedAtIndexToProjects < ActiveRecord::Migration[5.1]
  def change
    add_index :projects, :posted_at
  end
end
