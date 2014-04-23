class PasswordsController < Devise::PasswordsController
  before_action :get_skills
  before_action :get_industries

  def new
    super
  end

  def create
    super
  end

  # def after_sign_up_path_for(resource)
  #   edit_company_path(resource)
  # end

  def get_skills
    @skills = Skill.all
  end

  def get_industries
    @industries = Industry.all
  end
end
