class EconomyBetsController < ApplicationController
  before_action :set_economy_bet, only: [:show, :edit, :update, :destroy]

  # GET /economy_bets
  # GET /economy_bets.json
  def index
    @economy_bets = EconomyBet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @economy_bets }
    end
  end

  # GET /economy_bets/1
  # GET /economy_bets/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @economy_bet }
    end
  end

  # GET /economy_bets/new
  def new
    @economy_bet = EconomyBet.new
  end

  # GET /economy_bets/1/edit
  def edit
  end

  # POST /economy_bets
  # POST /economy_bets.json
  def create
    @economy_bet = EconomyBet.new(economy_bet_params)

    respond_to do |format|
      if @economy_bet.save
        format.html { redirect_to @economy_bet, notice: 'Economy bet was successfully created.' }
        format.json { render json: @economy_bet, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @economy_bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /economy_bets/1
  # PATCH/PUT /economy_bets/1.json
  def update
    respond_to do |format|
      if @economy_bet.update(economy_bet_params)
        format.html { redirect_to @economy_bet, notice: 'Economy bet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @economy_bet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /economy_bets/1
  # DELETE /economy_bets/1.json
  def destroy
    @economy_bet.destroy
    respond_to do |format|
      format.html { redirect_to economy_bets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_economy_bet
      @economy_bet = EconomyBet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def economy_bet_params
      params.require(:economy_bet).permit(:lower_limit, :upper_limit, :points)
    end
end
