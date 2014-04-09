class RegistrationsController < Devise::RegistrationsController
  before_action :get_skills

  def new
    super
  end

  def get_skills
    @skills = Skill.all
  end
end
