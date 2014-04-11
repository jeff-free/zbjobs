class SessionsController < Devise::SessionsController
  before_action :get_skills
  before_action :get_industries

  def after_sign_in_path_for(resource)

    @company = Company.find(resource)
    if @company.check_info_done?
      root_path
    else
      edit_company_path(resource)
    end
  end
  
  def get_skills
    @skills = Skill.all
  end
end
