require 'sequel'

Sequel.migration do
  up do
    create_table(:alumno_estados) do
      primary_key :id
      String :nombre, null: false, size: 12
    end
	end

  down do
    drop_table(:alumno_estados)
	end
end
