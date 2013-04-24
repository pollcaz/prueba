class EstudiantePdf < Prawn::Document

	def initialize(horario, estudiante, view)
	  super()
	  @estudiante = estudiante
	  @horario = horario
	  @view = view
	  logo
	  titulo
	  vista
	  canvas do
			fill_circle [bounds.left, bounds.top], 30
			fill_circle [bounds.right, bounds.top], 30
			fill_circle [bounds.right, bounds.bottom], 30
			fill_circle [0, 0], 30
		end
	end

	def logo
	  logopath =  "#{Rails.root}/app/assets/images/rails.png"
	  image logopath
	  move_down(30)
	end

	def titulo
		text "Estudiante ##{@estudiante.id} ", :mode => :stroke, :size => 50, :style => :bold, :align => :center
	end


	def vista
		move_down(40)
		foto = "#{@estudiante.foto.path(:small)}"
		image foto, :position => :center
	    table ([
	    ["Nombre", "#{@estudiante.nombres} "],
	    ["Cedula", "#{@estudiante.cedula} "],
	    ["eMail", "#{@estudiante.email} "],
	    ["Direccion", "#{@estudiante.direccion} "],
	    ["Fecha de Nacimiento", "#{@estudiante.fch_nacimiento} "],
	    ["Curso", "#{@estudiante.curso.nombre} "],
	    ]), :width => 550 do
	      columns(1).align = :center
	      self.header = true
	      align = :center
	      self.column_widths = {0 => 200, 3 => 100}
	      columns(2).font_style = :bold
	    end
	end
end