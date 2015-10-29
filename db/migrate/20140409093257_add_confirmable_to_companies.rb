class AddConfirmableToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :confirmation_token, :string
    add_column :companies, :confirmed_at, :datetime
    add_column :companies, :confirmation_sent_at, :datetime
    add_index :companies, :confirmation_token, unique: true
    Company.update_all(confirmed_at: Time.now)
  end
end
