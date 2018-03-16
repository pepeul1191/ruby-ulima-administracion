require 'sequel'

Sequel.migration do
  up do
    create_table(:alumnos) do
      primary_key :id
      Integer :codigo, null: false
      String :dni, null: false, size: 8
      String :nombres, null: false, size: 40
      String :paterno, null: false, size: 30
      String :materno, null: false, size: 30
      String :correo_alumno, null: false, size: 30
      String :correo_personal, null: false, size: 30
      String :celular, null: false, size: 15
    end

    alter_table(:alumnos) do
      add_foreign_key :carrera_id, :carreras
      add_foreign_key :estado_alumno_id, :estado_alumnos
    end
	end

  down do
    drop_column :alumnos, :carrera_id
    drop_column :alumnos, :estado_alumno_id
    drop_table(:alumnos)
	end
end
