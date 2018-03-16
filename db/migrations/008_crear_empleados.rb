require 'sequel'

Sequel.migration do
  up do
    create_table(:empleados) do
      primary_key :id
      Integer :codigo, null: false
      String :dni, null: false, size: 8
      String :nombres, null: false, size: 40
      String :paterno, null: false, size: 30
      String :materno, null: false, size: 30
      String :correo_laboral, null: false, size: 30
      String :correo_personal, null: false, size: 30
      String :celular, null: false, size: 15
    end

    alter_table(:empleados) do
      add_foreign_key :cargo_id, :carreras
    end
	end

  down do
    drop_column :carreras, :cargo_id
    drop_table(:carreras)
	end
end
