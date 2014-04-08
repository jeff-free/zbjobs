class AddColumnsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :name, :string
    add_column :companies, :address, :string
    add_column :companies, :phone, :string
    add_column :companies, :scale, :integer
    add_column :companies, :industry, :string
  end
end
