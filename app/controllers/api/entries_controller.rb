module Api
class EntriesController < ApplicationController
  include RenderHelper
  before_action :set_entry, only: [:show, :edit, :update, :destroy], raise: false
  skip_before_action :authenticate_user!, only: [:create], raise: false
  respond_to :json
  def all
  end
  def default_serializer_options
    { root: false }
  end

  # GET /entries
  # GET /entries.json
  def index
    puts 'index'
    @entries = Entry.all.is_in_parking
    render_default_format(@entries,true,200)
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    render_default_format(@entry,true,200)
  rescue Exception => e
    puts e.inspect
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    if @entry.plate_has_an_entry?
      render_default_error 'hay un error, Esta placa ya ha sido ingresada', 401
    else
        @entry.is_parking= true
        if @entry.save
          render_success_format('Nueva entrada registrada',@entry,true)
        end
    end
  rescue Exception => e
    render_default_error e, 401
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
       @entry.update_attributes!(entry_params)
       render_success_format('Entrada actualizada',@entry,true)
  rescue Exception => e
    render_default_error e, 401

  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    render_success_format('Entrada eliminada',@entry,true)
  rescue Exception => e
    render_default_error e, 401
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def entry_params
    params.permit(:plate, :date_arrival, :hour_arrival, :place)
  end
end
  end