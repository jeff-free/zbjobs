class ConfirmationsController < Devise::ConfirmationsController
  before_action :get_skills
  before_action :get_industries

  def get_skills
    @skills = Skill.all
  end

  def get_industries
    @industries = Industry.all
  end
end
