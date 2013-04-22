class Materia < ActiveRecord::Base

	#Metodo de busqueda
    def self.search(search) 	
		where('nombre like ?', "%#{search}%") 
	end

	#Atributos accesibles
	attr_accessible :nombre

	#Reglas de negocio
	validates :nombre, :presence => true, :length => { :maximum => 50 }

	#Mapeo
	has_many :horarios
end

