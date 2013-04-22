class Horario < ActiveRecord::Base
  #Metodo de Busqueda
	def self.search(search) 	
		where('aula like ?', "%#{search}%") 
	end

  #Atributos accesibles
  attr_accessible :dia, :hora, :aula, :instructor_id, :materia_id, :curso_id, :materia_nombre

  #Reglas de Negocio
  validates :aula, :presence => true, :numericality => true

  validates :materia_id, :presence => true

  validates :curso_id, :presence => true

  validates :instructor_id, :presence => true

  #Mapeo Relacional
  belongs_to :materia
  belongs_to :instructor
  belongs_to :curso

  def instructor_nombre
      instructor.nombre if instructor
  end

  def instructor_nombre=(nombre)
    self.instructor = Instructor.find_or_create_by_nombre(nombre) unless nombre.blank?      
  end

  def curso_nombre
      curso.nombre if curso
  end

  def curso_nombre=(nombre)
    self.curso = Curso.find_or_create_by_nombre(nombre) unless nombre.blank?      
  end

  def materia_nombre
      materia.nombre if materia
  end

  def materia_nombre=(nombre)
    self.materia = Materia.find_or_create_by_nombre(nombre) unless nombre.blank?      
  end
end
