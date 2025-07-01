class Admin::AgenciesController < ApplicationController
  before_action :ensure_admin
  before_action :set_agency, only: [:show, :edit, :update, :destroy]
  layout "admin"

  # GET /admin/agencies
  def index
    @agencies = Agency.includes(:tags).order(:name)
  end

  # GET /admin/agencies/1
  def show
  end

  # GET /admin/agencies/new
  def new
    @agency = Agency.new
  end

  # GET /admin/agencies/1/edit
  def edit
  end

  # POST /admin/agencies
  def create
    @agency = Agency.new(agency_params)

    if @agency.save
      redirect_to admin_agency_path(@agency), notice: "Agence créée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admin/agencies/1
  def update
    if @agency.update(agency_params)
      redirect_to admin_agency_path(@agency), notice: "Agence mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /admin/agencies/1
  def destroy
    @agency.destroy
    redirect_to admin_agencies_path, notice: "Agence supprimée avec succès."
  end

  private

  def set_agency
    @agency = Agency.find(params[:id])
  end

  def agency_params
    params.require(:agency).permit(:name, :description, :location, :team_size, :creation_date,
                                   :annual_turnover, :website_url, tag_ids: [])
  end
end
