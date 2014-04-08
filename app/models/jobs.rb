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
#

class Jobs < ActiveRecord::Base
end
