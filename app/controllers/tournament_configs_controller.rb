class TournamentConfigsController < ApplicationController
  before_action :set_tournament_config, only: [:show, :edit, :update, :destroy]

  # GET /tournament_configs
  # GET /tournament_configs.json
  def index
    @tournament_configs = TournamentConfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tournament_configs }
    end
  end

  # GET /tournament_configs/1
  # GET /tournament_configs/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tournament_config }
    end
  end

  # GET /tournament_configs/new
  def new
    @tournament_config = TournamentConfig.new
  end

  # GET /tournament_configs/1/edit
  def edit
  end

  # POST /tournament_configs
  # POST /tournament_configs.json
  def create
    @tournament_config = TournamentConfig.new(tournament_config_params)

    respond_to do |format|
      if @tournament_config.save
        format.html { redirect_to @tournament_config, notice: 'Tournament config was successfully created.' }
        format.json { render json: @tournament_config, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @tournament_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament_configs/1
  # PATCH/PUT /tournament_configs/1.json
  def update
    respond_to do |format|
      if @tournament_config.update(tournament_config_params)
        format.html { redirect_to @tournament_config, notice: 'Tournament config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tournament_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_configs/1
  # DELETE /tournament_configs/1.json
  def destroy
    @tournament_config.destroy
    respond_to do |format|
      format.html { redirect_to tournament_configs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_config
      @tournament_config = TournamentConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_config_params
      params.require(:tournament_config).permit(:start_date, :end_date, :period, :days)
    end
end
