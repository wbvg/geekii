class AddStatusesTable < ActiveRecord::Migration
  def change
      create_table :statuses do |t|
      t.integer :user_id
      t.string :category
      t.string :status
      t.boolean :need_help, :default => false
      t.timestamps
    end
  end
end