# == Schema Information
#
# Table name: industries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Industry < ActiveRecord::Base
  has_many :companies
  has_many :jobs
end
