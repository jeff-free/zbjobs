class IndustriesController < ApplicationController
  before_action :get_skills
  before_action :get_industries
  before_action :find_industry

  def show
    @jobs = @industry.jobs.page(params[:pages])
  end

  def find_industry
    @industry = Industry.find(params[:id])
  end
end
