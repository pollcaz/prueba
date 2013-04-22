class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :nombres
      t.string :cedula
      t.string :email
      t.string :direccion
      t.date :fch_nacimiento
      t.integer :curso_id

      t.timestamps
    end
  end
end
