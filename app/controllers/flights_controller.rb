class FlightsController < ApplicationController
  before_action :check_for_admin , :only => [:new,:edit,:destroy]
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
    @flights.each do |f|
      if f.airplane_id.present?
        f_rows = Airplane.find(f.airplane_id).rows
        f_columns = Airplane.find(f.airplane_id).columns
        f_plane_array = []
        (0...f_rows*f_columns).each do |i|
          f_plane_array << i.to_s
        end
        f.reservations.each do |r|
          if r.seat.present? && f_plane_array.include?(r.seat)
            f_plane_array.delete(r.seat)
          end
        end
        # f.plane = f_plane_array.size
        f.plane = f_plane_array.join(',')
        f.save
      else
        f.plane =''
        f.save
      end
    end
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(:number, :origin, :destination, :date, :plane, :airplane_id)
    end
end
