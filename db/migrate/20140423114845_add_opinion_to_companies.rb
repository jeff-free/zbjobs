class AddOpinionToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :opinion, :text
  end
end
