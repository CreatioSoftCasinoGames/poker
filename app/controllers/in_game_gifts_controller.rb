class InGameGiftsController < ApplicationController
  before_action :set_in_game_gift, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /in_game_gifts
  # GET /in_game_gifts.json
  def index
    @in_game_gifts = InGameGift.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @in_game_gifts }
    end
  end

  # GET /in_game_gifts/1
  # GET /in_game_gifts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @in_game_gift }
    end
  end

  # GET /in_game_gifts/new
  def new
    @in_game_gift = InGameGift.new
  end

  # GET /in_game_gifts/1/edit
  def edit
  end

  # POST /in_game_gifts
  # POST /in_game_gifts.json
  def create
    @in_game_gift = InGameGift.new(in_game_gift_params)

    respond_to do |format|
      if @in_game_gift.save
        format.html { redirect_to @in_game_gift, notice: 'In game gift was successfully created.' }
        format.json { render json: @in_game_gift, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @in_game_gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /in_game_gifts/1
  # PATCH/PUT /in_game_gifts/1.json
  def update
    respond_to do |format|
      if @in_game_gift.update(in_game_gift_params)
        format.html { redirect_to @in_game_gift, notice: 'In game gift was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @in_game_gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_game_gifts/1
  # DELETE /in_game_gifts/1.json
  def destroy
    @in_game_gift.destroy
    respond_to do |format|
      format.html { redirect_to in_game_gifts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_in_game_gift
      @in_game_gift = InGameGift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def in_game_gift_params
      params.require(:in_game_gift).permit(:name, :cost)
    end
end
