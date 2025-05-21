class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[ show edit update destroy ]

  # GET /exercises or /exercises.json
  def index
    @exercises = Exercise.all
  end

  # GET /exercises/1 or /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @program = Program.find(params[:program_id])
    @workout = @program.workouts.find(params[:workout_id])
    @exercise = @workout.exercises.build
    
    render "programs/workouts/exercises/new"
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises or /exercises.json
  def create
    @program = Program.find(params[:program_id])
    @workout = @program.workouts.find(params[:workout_id])
    @exercise = @workout.exercises.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: "Exercise was successfully created." }
        @exercisesn = @workout.exercises.build
        format.turbo_stream { render "programs/workouts/exercises/create" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @exercise.destroy!

    respond_to do |format|
      format.html { redirect_to exercises_path, status: :see_other, notice: "Exercise was successfully destroyed." }
      format.turbo_stream {render "programs/workouts/exercises/destroy"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @program = Program.find(params[:program_id])
      @workout = @program.workouts.find(params[:workout_id])
      @exercise = @workout.exercises.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      params.expect(exercise: [ :name, :sets, :reps, :workout_id ])
    end
end
