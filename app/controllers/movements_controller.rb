class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show edit update destroy ]

  # GET /movements or /movements.json
  def index
    @movements = Movement.all
  end

  # GET /movements/1 or /movements/1.json
  def show
  end

  # GET /movements/new
  def new
    @session = Session.find(params[:session_id])
    @movement = @session.movements.build

    render "/sessions/movements/new"
  end

  # GET /movements/1/edit
  def edit
  end

  # POST /movements or /movements.json
  def create
    @session = Session.find(params[:session_id])
    @movement = @session.movements.new(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to @movement, notice: "Movement was successfully created." }
        @movementn = @session.movements.build
        format.turbo_stream { render "sessions/movements/create" }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1 or /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to @movement, notice: "Movement was successfully updated." }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1 or /movements/1.json
  def destroy
    @movement.destroy!

    respond_to do |format|
      format.html { redirect_to movements_path, status: :see_other, notice: "Movement was successfully destroyed." }
      format.turbo_stream {render "/sessions/movements/destroy" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @session = Session.find(params[:session_id])
      @movement = @session.movements.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def movement_params
      params.expect(movement: [ :name, :notes, :work ])
    end
end
