class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def get_skills
    @skills = Skill.all
  end

  def get_industries
    @industries = Industry.all
  end
end
