class AddUnconfirmableToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :unconfirmed_email, :string
    Company.update_all(confirmed_at: Time.now)
  end
end
