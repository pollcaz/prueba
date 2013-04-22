class Instructor < ActiveRecord::Base

  #Atributos accesibles
  attr_accessible :cedula, :direccion, :email, :fch_ncto, :materia_id, :nombres, :telefono
  
  #Metodo de Busqueda
  def self.search(search) 	
		where("nombres like '%#{search}%' or email like '%#{search}%' or telefono like '%#{search}%' or direccion like '%#{search}%'") 
  end

  #Mapeo Relacional
  has_many :horarios

  #Reglas de Negocio
  validates :nombres, :presence => true, :length => { :maximum => 80 } 

  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :cedula, :presence => true, :uniqueness => true, :length => { :minimum => 6, :maximum => 15 }, :numericality => true

  validates :direccion, :presence => true

  validates :telefono, :presence => true, :length => { :minimum => 6, :maximum => 15 }, :numericality => true

end
