# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text
#  requirement   :text
#  created_at    :datetime
#  updated_at    :datetime
#  skill_id      :integer
#  company_id    :integer
#  link          :string(255)
#  salary_from   :integer
#  salary_to     :integer
#  annual_salary :integer
#  how_to_apply  :text
#

class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :skill

end
