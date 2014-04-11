class RemoveScaleIndustryCompany < ActiveRecord::Migration
  def change
    remove_column :companies, :scale
    remove_column :companies, :industry
  end
end
