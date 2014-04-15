class ChangeDataTypeJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :type
    add_column :jobs, :is_fulltime, :boolean 
  end
end
