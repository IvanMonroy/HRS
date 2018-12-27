module Api
class ExitsController < ApplicationController
  include RenderHelper
  before_action :set_exit, only: [:show, :edit, :update, :destroy], raise: false
  skip_before_action :authenticate_user!, only: [:create], raise: false
  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end
  # GET /exits
  # GET /exits.json
  def index
    @exits = Exit.all
    render_default_format(@exits, true, 200)
  end

  # GET /exits/1
  # GET /exits/1.json
  def show
    render_default_format(@exit, true, 200)
  rescue Exception => e
    puts e.inspect

  end

  # GET /exits/new
  def new
    @exit = Exit.new
    @rate = Rate
    @entry = Entry
  end

  # GET /exits/1/edit
  def edit
  end

  # POST /exits
  # POST /exits.json
  def create
    @exit = Exit.new(exit_params)
    if @exit.rate_is_valid?

       render_default_error 'hay un error', 401
    else
      @exit.exit_parking
      if @exit.save
        render_success_format('Nueva salida registrada',@exit,true)
      end
    end
  rescue Exception => e
    render_default_error e, 401
  end


  # PATCH/PUT /exits/1
  # PATCH/PUT /exits/1.json
  def update
      @exit.update_attributes!(exit_params)
      render_success_format('La salida fue actualizada', @exit,true )
  rescue Exception => e
       render_default_error e, 401
  end

  # DELETE /exits/1
  # DELETE /exits/1.json
  def destroy
    @exit.destroy
    render_success_format('Salida eliminada',@exit,true)
  rescue Exception => e
    render_default_error e, 401
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exit
      @exit = Exit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exit_params
      params.permit(:entry_id, :date_departure, :hour_departure, :rate_id, :ammount_to_paid, :discount)
    end
end
  end
