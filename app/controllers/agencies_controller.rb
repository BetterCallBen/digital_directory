class AgenciesController < ApplicationController
  before_action :set_agency, only: [:show, :edit, :update, :destroy]

  # GET /agencies
  def index
    @agencies = Agency.includes(:tags).order(:id)
  end

  # GET /agencies/1
  def show
  end

  # GET /agencies/new
  def new
    @agency = Agency.new
  end

  # GET /agencies/1/edit
  def edit
  end

  # POST /agencies
  def create
    @agency = Agency.new(agency_params)

    if @agency.save
      redirect_to @agency, notice: 'L\'agence a été créée avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agencies/1
  def update
    if @agency.update(agency_params)
      redirect_to @agency, notice: 'L\'agence a été mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /agencies/1
  def destroy
    @agency.destroy
    redirect_to agencies_url, notice: 'L\'agence a été supprimée avec succès.'
  end

  private

  def set_agency
    @agency = Agency.find(params[:id])
  end

  def agency_params
    params.require(:agency).permit(:name, :logo, :creation_date, :annual_turnover, :location, :team_size, :website_url)
  end
end
