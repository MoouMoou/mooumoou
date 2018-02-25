class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :type
      t.string :origin_id
      t.integer :status
      t.string :title
      t.text :body
      t.string :origin_url
      t.datetime :posted_at

      t.timestamps
    end
  end
end
