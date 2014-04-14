class CompaniesController < ApplicationController
  before_action :get_skills
  before_action :get_industries
  before_action :find_company, only: [:show, :edit, :update, :destroy]
  def show
    @jobs = @company.jobs.page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to root_path
    end
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :address, :phone)
  end
end
