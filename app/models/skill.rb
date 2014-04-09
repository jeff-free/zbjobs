# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Skill < ActiveRecord::Base
  has_many :jobs
end
