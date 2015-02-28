class LoginHistoriesController < ApplicationController
  before_action :set_login_history, only: [:show, :edit, :update, :destroy]

  # GET /login_histories
  # GET /login_histories.json
  def index
    @login_histories = LoginHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @login_histories }
    end
  end

  # GET /login_histories/1
  # GET /login_histories/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @login_history }
    end
  end

  # GET /login_histories/new
  def new
    @login_history = LoginHistory.new
  end

  # GET /login_histories/1/edit
  def edit
  end

  # POST /login_histories
  # POST /login_histories.json
  def create
    @login_history = LoginHistory.new(login_history_params)

    respond_to do |format|
      if @login_history.save
        format.html { redirect_to @login_history, notice: 'Login history was successfully created.' }
        format.json { render json: @login_history, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @login_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /login_histories/1
  # PATCH/PUT /login_histories/1.json
  def update
    respond_to do |format|
      if @login_history.update(login_history_params)
        format.html { redirect_to @login_history, notice: 'Login history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @login_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /login_histories/1
  # DELETE /login_histories/1.json
  def destroy
    @login_history.destroy
    respond_to do |format|
      format.html { redirect_to login_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_login_history
      @login_history = LoginHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def login_history_params
      params.require(:login_history).permit(:active, :user_id, :login_token)
    end
end
