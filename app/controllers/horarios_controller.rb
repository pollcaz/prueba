class HorariosController < ApplicationController

  before_filter :find_horario
  helper_method :sort_column, :sort_direction 
  autocomplete :curso, :nombre, :full => true
  autocomplete :materia, :nombre, :full => true
  autocomplete :instructor, :nombre, :full => true

  def index
   if params[:limit] == nil then
    params[:limit] = 2
   end
   @horarios = Horario.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
   respond_to do |format| 
   format.html 
   format.json { render :json => @cursos } 
   end
  end

  def show
    if params[:format] == "pdf" then
      pdf = HorarioPdf.new(@horario, view_context)
      send_data pdf.render, filename: "horario_#{@horario.id}.pdf",
      type: "application/pdf"
    end
  end

  def new
      @horario = Horario.new
  end

  def edit
      @horario = Horario.find(params[:id])
  end

  def create
      @horario = Horario.new(params[:horario])
      render :action => :new unless @horario.save
  end

  def update
      @horario = Horario.find(params[:id])
      render :action => :edit unless @horario.update_attributes(params[:horario])
  end

  def destroy
      @horario = Horario.find(params[:id])
      @horario.destroy
  end

  def find_horario
      @horario = Horario.find(params[:id]) if params[:id]
  end

  def sort_column
    Horario.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction 
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end