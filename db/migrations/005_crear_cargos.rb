require 'sequel'

Sequel.migration do
  up do
    create_table(:cargos) do
      primary_key :id
      String :nombre, null: false, size: 20
    end
	end

  down do
    drop_table(:cargos)
	end
end
