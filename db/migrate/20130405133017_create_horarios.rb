class CreateHorarios < ActiveRecord::Migration
  def change
    create_table :horarios do |t|
      t.date :dia
      t.time :hora
      t.string :aula
      t.integer :materia_id
      t.integer :instructor_id
      t.integer :curso_id

      t.timestamps
    end
  end
end
