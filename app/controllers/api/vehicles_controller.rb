module Api
class VehiclesController < ApplicationController
  include RenderHelper
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy], raise: false
  before_action :set_plate, only: [:show], raise: false
  skip_before_action :authenticate_user!, only: [:create], raise: false
  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end
  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all.order(id: :asc)
    render_default_format(@vehicles,true,200)
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show1
    render_default_format(@vehicles,true,200)
  rescue Exception => e
    puts e.inspect
  end

  def show
    render_default_format(@vehicle,true,200)
  rescue Exception => e
    puts e.inspect
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        render_success_format('Nuevo vehículo registrado',@vehicle,true)
      end
  rescue Exception => e
    render_default_error e, 401
  end


  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
       @vehicle.update_attributes!(vehicle_params)
       render_success_format('Vehículo actualizado',@vehicle,true)
  rescue Exception => e
    render_default_error e, 401
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    render_success_format('Vehículo Eliminado',@vehicle,true)
  rescue Exception => e
    render_default_error e, 401
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plate
      @vehicles = Vehicle.where("plate like ? ",params[:plate])
    end
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.permit(:plate, :brand, :year)
    end
end
end