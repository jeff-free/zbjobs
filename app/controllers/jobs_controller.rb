class JobsController < ApplicationController
  before_action :get_company
  before_action :get_skills
  before_action :get_industries
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_company!, only: [:create, :edit, :new, :update, :destroy]
  def index
    @jobs = Job.order("id DESC").page(params[:page]).per(10)
  end

  def show
  end

  def new
    @job = @company.jobs.new
    @skills = Skill.all
  end

  def create
    @job = @company.jobs.new(jobs_params)
    if @job.save
      flash[:success]
      redirect_to root_path
    end
  end

  private 

  def find_job  
    @job = Job.find(params[:id])
    
  end

  def get_company
    @company = current_company
  end

  def jobs_params
    params.require(:job).permit(:name, :description, :requirement, 
      :link, :salary_from, :salary_to, :annual_salary, :how_to_apply, :is_fulltime, :skill_id)
  end

end
