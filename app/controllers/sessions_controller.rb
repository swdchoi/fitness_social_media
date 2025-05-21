class SessionsController < ApplicationController
  before_action :set_session, only: %i[ show edit update destroy ]

  # GET /sessions or /sessions.json
  def index
    @sessions = current_user.sessions.all
  end

  # GET /sessions/1 or /sessions/1.json
  def show
    @comments = @session.comments.all
  end

  # GET /sessions/new
  def new
    @session = current_user.sessions.new
    if params[:workout_id].present?
      @workout = Workout.find(params[:workout_id])
    end
    @session.movements.build
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions or /sessions.json
  def create
    @session = current_user.sessions.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to @session, notice: "Session was successfully created." }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1 or /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: "Session was successfully updated." }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1 or /sessions/1.json
  def destroy
    @session.destroy!

    respond_to do |format|
      format.html { redirect_to sessions_path, status: :see_other, notice: "Session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:date, :name, :workout_id, movements_attributes: [ :session_id, :id, :name, :notes, :work, :exercise_id ])
    end
end
