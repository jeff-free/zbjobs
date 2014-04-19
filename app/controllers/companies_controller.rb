class CompaniesController < ApplicationController
  before_action :get_skills
  before_action :get_industries
  before_action :is_company, only: [:edit, :update, :destroy]

  def show
    @company = Company.find(params[:id])
    @jobs = @company.jobs.page(params[:page]).per(5)
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to root_path
    end
  end

  def destroy
    @company.destroy
    redirect_to root_path
  end

  private

  def is_company
    @company = current_company
    if @company.id.to_s == params[:id].to_s
      render :edit
    else
      redirect_to root_path
    end
  end

  def company_params
    params.require(:company).permit(:name, :address, :phone)
  end
end
