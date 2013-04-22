class Estudiante < ActiveRecord::Base
	#Metodo de Busqueda
	def self.search(search) 	
		where("nombres like '%#{search}%' or email like '%#{search}%' or cedula like '%#{search}%' or direccion like '%#{search}%'")  
	end

	#Mapeo relacional
	belongs_to :curso

	#Atributos accesibles
    attr_accessible :foto, :cedula, :curso_id, :direccion, :email, :fch_nacimiento, :nombres

    #Reglas de negocio
    validates :nombres, :presence => true, :length => { :maximum => 80 } 

    validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

	validates :cedula, :presence => true, :uniqueness => true, :length => { :minimum => 6, :maximum => 15 }, :numericality => true

	validates :direccion, :presence => true

	validates :curso_id, :presence => true

	has_attached_file :foto, :styles => { :small => "150x150>" },
                  :url  => "/assets/estudiantes/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/estudiantes/:id/:style/:basename.:extension"

	validates_attachment_presence :foto
	validates_attachment_size :foto, :less_than => 5.megabytes
	validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png']

end
