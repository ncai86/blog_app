class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :commenter_name
      t.integer :post_id
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
