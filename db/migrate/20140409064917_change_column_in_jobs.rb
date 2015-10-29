class ChangeColumnInJobs < ActiveRecord::Migration
  def change
    change_column :jobs, :how_to_apply, :text
  end
end
