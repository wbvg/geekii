class RemoveSkillIdFromProfilesTable < ActiveRecord::Migration
  def change
    remove_column :profiles, :skill_id
  end
end
