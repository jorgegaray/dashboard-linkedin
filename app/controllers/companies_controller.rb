class CompaniesController < ApplicationController
  before_action :load_resource, only: :create

  def create
    if @company.save
      flash[:notice] = "Creado"
    else
      flash[:error] = "Error al crear"
    end
  end

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end
  

  def update
  end

  def index
  
  end

  def find_companies
    @companies = Company.buscar(linkedin_params["name"], linkedin_params["role"])
    render :index
  end

  private
    def company_params
      params.require(:company).permit([:name, :description, :area, :web, :country, :email, :size])
    end

    def linkedin_params
      params.require(:linkedin).permit([:name, :role])
    end

    def load_resource
      @company = Company.new(company_params)
    end
end