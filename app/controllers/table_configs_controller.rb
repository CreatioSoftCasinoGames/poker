class TableConfigsController < ApplicationController
  before_action :set_table_config, only: [:show, :edit, :update, :destroy]

  # GET /table_configs
  # GET /table_configs.json
  def index
    @table_configs = TableConfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_configs }
    end
  end

  # GET /table_configs/1
  # GET /table_configs/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_config }
    end
  end

  # GET /table_configs/new
  def new
    @table_config = TableConfig.new
  end

  # GET /table_configs/1/edit
  def edit
  end

  # POST /table_configs
  # POST /table_configs.json
  def create
    @table_config = TableConfig.new(table_config_params)

    respond_to do |format|
      if @table_config.save
        format.html { redirect_to @table_config, notice: 'Table config was successfully created.' }
        format.json { render json: @table_config, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @table_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_configs/1
  # PATCH/PUT /table_configs/1.json
  def update
    respond_to do |format|
      if @table_config.update(table_config_params)
        format.html { redirect_to @table_config, notice: 'Table config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @table_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_configs/1
  # DELETE /table_configs/1.json
  def destroy
    @table_config.destroy
    respond_to do |format|
      format.html { redirect_to table_configs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_config
      @table_config = TableConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_config_params
      params.require(:table_config).permit(:name, :small_blind, :big_blind, :min_player, :max_player, :min_buy_in, :max_buy_in, :game_type, :fee, :pot)
    end
end
