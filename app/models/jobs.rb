# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  requirement :text
#  created_at  :datetime
#  updated_at  :datetime
#  industry_id :integer
#  skill_id    :integer
#  company_id  :integer
#

class Jobs < ActiveRecord::Base
  belongs_to :company
  belongs_to :industry
  belongs_to :skill
end
