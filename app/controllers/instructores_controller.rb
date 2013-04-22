class InstructoresController < ApplicationController
 
 before_filter :find_instructor
 helper_method :sort_column, :sort_direction 


  def index
   if params[:limit] == nil then
    params[:limit] = 2
   end
   @instructores = Instructor.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
   respond_to do |format| 
   format.html # index.html.erb 
   format.json { render :json => @instructores} 
   end
  end

  
  def show
      @instructor = Instructor.find(params[:id])
  end

  def new
      @instructor = Instructor.new
  end

  def edit
      @instructor = Instructor.find(params[:id])
  end

  def create
      @instructor = Instructor.new(params[:instructor])
      render :action => :new unless @instructor.save
  end

  def update
      @instructor= Instructor.find(params[:id])
      render :action => :edit unless @instructor.update_attributes(params[:instructor])
  end

  def destroy
      @instructor = Instructor.find(params[:id])
      @instructor.destroy
  end

  def find_instructor
      @instructor = Instructor.find(params[:id]) if params[:id]
  end

  def sort_column
    Instructor.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction 
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
