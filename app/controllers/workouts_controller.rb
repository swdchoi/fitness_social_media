class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[ show edit update destroy ]

  # GET /workouts or /workouts.json
  def index
    @workouts = Workout.all
  end

  # GET /workouts/1 or /workouts/1.json
  def show
    @program = Program.find(params[:program_id])
    render "programs/workouts/show"
  end

  # GET /workouts/new
  def new
    @program = current_user.programs.find(params[:program_id])
    @workout = @program.workouts.build
    @workout.exercises.build

    render "programs/workouts/new"
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts or /workouts.json
  def create

    @program = current_user.programs.find(params[:program_id])
    @workout = @program.workouts.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: "Workout was successfully created." }
        @workoutn = @program.workouts.build
        @workoutn.exercises.build
        format.turbo_stream {render "programs/workouts/create"}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1 or /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: "Workout was successfully updated." }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1 or /workouts/1.json
  def destroy
    @workout.destroy!

    respond_to do |format|
      format.turbo_stream { render "programs/workouts/destroy" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @program = current_user.programs.find(params[:program_id])
      @workout = @program.workouts.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :desc, :program_id, exercises_attributes: [ :id, :name, :sets, :reps, :workout_id ] )
    end
end
