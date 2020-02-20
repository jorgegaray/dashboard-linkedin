class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]


  def index
    @companies = Company.all
  end


  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end


  def create
    @company= Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @company}
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
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

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def find_companies
    Scraper.scrapeCompany(linkedin_params["name"])
    @companies = Company.buscar(linkedin_params["name"])
    render :index
  end

  def find_linkedin
    return handle_unverified_request if params.require(:state) != session.delete("linkedin.state")

    linkedin = Linkedin::Token.call
    @companies = Company.buscar(linkedin_params["name"])
    session["linkedin.state"] = state
    render :index
  end

  def find_linkedin_oauth
    state = find_linkedin_companies_path(@seleccion) + '%%%' + SecureRandom.hex(24)
    session["linkedin.state"] = state

    linkedin = Linkedin::Token.call

    respond_to do |format|
      format.html { redirect_to linkedin.auth_url(state) }
      format.js {}
    end
    @companies = Company.buscar(linkedin_params["name"])
    #state = Tenant.current_tenant.host + linkedin_publish_seleccion_path(@seleccion) + '%%%' + SecureRandom.hex(24)
    linkedin = Linkedin::Token.call
    session["linkedin.state"] = state
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