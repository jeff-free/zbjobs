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
#  is_fulltime   :boolean
#

class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :skill
  validates :name, presence: true
  validates :description, presence: true
  validates :requirement, presence: true
  validates :how_to_apply, presence: true
  validates :is_fulltime, presence: true
  def company_name
    company.name
  end

  def company_address
    company.address
  end
end
