class CreateInstructores < ActiveRecord::Migration
  def change
    create_table :instructores do |t|
      t.string :nombres
      t.string :cedula
      t.string :email
      t.string :direccion
      t.string :telefono
      t.date :fch_ncto
      t.integer :materia_id

      t.timestamps
    end
  end
end
