class CompaniesController < ApplicationController
  before_action :load_resource, only: :create
  before_action :set_company, only: [:edit, :update]

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

  def edit
  end

  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_company
    @company.destroy
    respond_to do |format|
      format.html { redirect_to company_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
    redirect_to company_path
  end

  def find_companies
    @companies = Company.buscar(linkedin_params["name"])
    byebug
    render :index
  end

  private
    def company_params
      params.require(:company).permit([:id, :name, :description, :area, :web, :country, :email, :size])
    end

    def linkedin_params
      params.require(:linkedin).permit([:name, :role])
    end

    def load_resource
      @company = Company.new(company_params)
    end

    def set_company
      @company = Company.find(params[:id])
    end
end