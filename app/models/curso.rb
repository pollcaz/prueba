class Curso < ActiveRecord::Base
  #Metodo de busqueda
  def self.search(search) 	
	where("nombre like '%#{search}%' or ficha like '%#{search}%'")
  end

  #Atributos accesibles
  attr_accessible :ficha, :nombre

  #Reglas de negocio
  validates :nombre, :presence => true, :length => { :maximum => 15 }

  validates :ficha, :presence => true, :numericality => true

  #Mapeo
  has_many :estudiantes
  belongs_to :curso
  has_many :horarios
  
end
