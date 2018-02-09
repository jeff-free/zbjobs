class AddColumnsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :link, :string
    add_column :jobs, :salary_from, :integer
    add_column :jobs, :salary_to, :integer
    add_column :jobs, :annual_salary, :integer
    add_column :jobs, :how_to_apply, :integer
  end
end
  