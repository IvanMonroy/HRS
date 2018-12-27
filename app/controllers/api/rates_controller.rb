module Api
  class RatesController < ApplicationController
  include RenderHelper

  before_action :set_rate, only: [:show, :edit, :update, :destroy], raise: false
  skip_before_action :authenticate_user!, only: [:create], raise: false
  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end

  # GET /rates
  # GET /rates.json
  def index
    @rates = Rate.all
    render_default_format(@rates,true,200)
  end

  # GET /rates/1
  # GET /rates/1.json
  def show
    render_default_format(@rate,true ,200)
  rescue Exception => e
    puts e.inspect
  end

  # GET /rates/new
  def new
    @rate = Rate.new
  end

  # GET /rates/1/edit
  def edit
  end

  # POST /rates
  # POST /rates.json
  def create
    @rate = Rate.new(rate_params)
      if @rate.save
        render_success_format('Tarifa creada',@rate,true)
      end
  rescue Exception => e
    render_default_error e, 401
  end

  # PATCH/PUT /rates/1
  # PATCH/PUT /rates/1.json
  def update
    @rate.update_attributes!(rate_params)
    render_success_format('Tarifa actualizada',@rate,true)
  rescue Exception => e
    render_default_error e, 401
  end

  # DELETE /rates/1
  # DELETE /rates/1.json
  def destroy
    @rate.destroy
    render_success_format('Tarifa eliminada',@rate,true)
  rescue Exception => e
    render_default_error e, 401
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    rescue Exception => e
      render_default_error e, 401
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.permit(:value, :name, :description, :date_begin, :date_end)

    end
  end
  end
