class EconomyParticipationsController < ApplicationController
  before_action :set_economy_participation, only: [:show, :edit, :update, :destroy]

  # GET /economy_participations
  # GET /economy_participations.json
  def index
    @economy_participations = EconomyParticipation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @economy_participations }
    end
  end

  # GET /economy_participations/1
  # GET /economy_participations/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @economy_participation }
    end
  end

  # GET /economy_participations/new
  def new
    @economy_participation = EconomyParticipation.new
  end

  # GET /economy_participations/1/edit
  def edit
  end

  # POST /economy_participations
  # POST /economy_participations.json
  def create
    @economy_participation = EconomyParticipation.new(economy_participation_params)

    respond_to do |format|
      if @economy_participation.save
        format.html { redirect_to @economy_participation, notice: 'Economy participation was successfully created.' }
        format.json { render json: @economy_participation, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @economy_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /economy_participations/1
  # PATCH/PUT /economy_participations/1.json
  def update
    respond_to do |format|
      if @economy_participation.update(economy_participation_params)
        format.html { redirect_to @economy_participation, notice: 'Economy participation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @economy_participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /economy_participations/1
  # DELETE /economy_participations/1.json
  def destroy
    @economy_participation.destroy
    respond_to do |format|
      format.html { redirect_to economy_participations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_economy_participation
      @economy_participation = EconomyParticipation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def economy_participation_params
      params.require(:economy_participation).permit(:lower_limit, :upper_limit, :winner_points, :other_winner_points, :participation_point, :stopper)
    end
end
