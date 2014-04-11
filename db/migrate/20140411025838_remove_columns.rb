class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :jobs, :industry_id
  end
end
