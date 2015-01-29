class EconomyRangesController < ApplicationController
  before_action :set_economy_range, only: [:show, :edit, :update, :destroy]

  # GET /economy_ranges
  # GET /economy_ranges.json
  def index
    @economy_ranges = EconomyRange.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @economy_ranges }
    end
  end

  # GET /economy_ranges/1
  # GET /economy_ranges/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @economy_range }
    end
  end

  # GET /economy_ranges/new
  def new
    @economy_range = EconomyRange.new
  end

  # GET /economy_ranges/1/edit
  def edit
  end

  # POST /economy_ranges
  # POST /economy_ranges.json
  def create
    @economy_range = EconomyRange.new(economy_range_params)

    respond_to do |format|
      if @economy_range.save
        format.html { redirect_to @economy_range, notice: 'Economy range was successfully created.' }
        format.json { render json: @economy_range, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @economy_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /economy_ranges/1
  # PATCH/PUT /economy_ranges/1.json
  def update
    respond_to do |format|
      if @economy_range.update(economy_range_params)
        format.html { redirect_to @economy_range, notice: 'Economy range was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @economy_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /economy_ranges/1
  # DELETE /economy_ranges/1.json
  def destroy
    @economy_range.destroy
    respond_to do |format|
      format.html { redirect_to economy_ranges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_economy_range
      @economy_range = EconomyRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def economy_range_params
      params.require(:economy_range).permit(:upper_limit, :lower_limit, :level)
    end
end
