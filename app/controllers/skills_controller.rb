class SkillsController < ApplicationController
  before_action :get_skills
  before_action :get_industries
  before_action :find_skill
  def show
    @jobs = @skill.jobs.page(params[:pages])
  end

  def find_skill
    @skill = Skill.find(params[:id])
  end
end
