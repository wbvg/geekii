class AddSkillToProfilesTable < ActiveRecord::Migration
  def change
    add_column :profiles, :label, :string
    add_column :profiles, :value, :integer
  end
end
