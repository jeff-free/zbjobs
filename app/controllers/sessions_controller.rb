class SessionsController < Devise::SessionsController
  before_action :get_skills
  
  def get_skills
    @skills = Skill.all
  end
end
