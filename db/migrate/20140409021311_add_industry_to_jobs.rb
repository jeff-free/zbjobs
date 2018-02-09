class AddIndustryToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :industry_id, :integer
    add_column :jobs, :skill_id, :integer
  end
end
