class RewardAndLevelsController < ApplicationController
  before_action :set_reward_and_level, only: [:show, :edit, :update, :destroy]

  # GET /reward_and_levels
  # GET /reward_and_levels.json
  def index
    @reward_and_levels = RewardAndLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reward_and_levels }
    end
  end

  # GET /reward_and_levels/1
  # GET /reward_and_levels/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reward_and_level }
    end
  end

  # GET /reward_and_levels/new
  def new
    @reward_and_level = RewardAndLevel.new
  end

  # GET /reward_and_levels/1/edit
  def edit
  end

  # POST /reward_and_levels
  # POST /reward_and_levels.json
  def create
    @reward_and_level = RewardAndLevel.new(reward_and_level_params)

    respond_to do |format|
      if @reward_and_level.save
        format.html { redirect_to @reward_and_level, notice: 'Reward and level was successfully created.' }
        format.json { render json: @reward_and_level, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @reward_and_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reward_and_levels/1
  # PATCH/PUT /reward_and_levels/1.json
  def update
    respond_to do |format|
      if @reward_and_level.update(reward_and_level_params)
        format.html { redirect_to @reward_and_level, notice: 'Reward and level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reward_and_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_and_levels/1
  # DELETE /reward_and_levels/1.json
  def destroy
    @reward_and_level.destroy
    respond_to do |format|
      format.html { redirect_to reward_and_levels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_and_level
      @reward_and_level = RewardAndLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_and_level_params
      params.require(:reward_and_level).permit(:lower_limit, :upper_limit, :reward, :level)
    end
end
