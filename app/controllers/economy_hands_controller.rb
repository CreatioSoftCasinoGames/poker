class EconomyHandsController < ApplicationController
  load_and_authorize_resource
  before_action :set_economy_hand, only: [:show, :edit, :update, :destroy]

  # GET /economy_hands
  # GET /economy_hands.json
  def index
    @economy_hands = EconomyHand.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @economy_hands }
    end
  end

  # GET /economy_hands/1
  # GET /economy_hands/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @economy_hand }
    end
  end

  # GET /economy_hands/new
  def new
    @economy_hand = EconomyHand.new
  end

  # GET /economy_hands/1/edit
  def edit
  end

  # POST /economy_hands
  # POST /economy_hands.json
  def create
    @economy_hand = EconomyHand.new(economy_hand_params)

    respond_to do |format|
      if @economy_hand.save
        format.html { redirect_to @economy_hand, notice: 'Economy hand was successfully created.' }
        format.json { render json: @economy_hand, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @economy_hand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /economy_hands/1
  # PATCH/PUT /economy_hands/1.json
  def update
    respond_to do |format|
      if @economy_hand.update(economy_hand_params)
        format.html { redirect_to @economy_hand, notice: 'Economy hand was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @economy_hand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /economy_hands/1
  # DELETE /economy_hands/1.json
  def destroy
    @economy_hand.destroy
    respond_to do |format|
      format.html { redirect_to economy_hands_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_economy_hand
      @economy_hand = EconomyHand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def economy_hand_params
      params.require(:economy_hand).permit(:hand_quality, :winner_point, :other_winner_point)
    end
end
