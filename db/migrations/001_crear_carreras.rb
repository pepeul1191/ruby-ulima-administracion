require 'sequel'

Sequel.migration do
  up do
    create_table(:carreras) do
      primary_key :id
      String :nombre, null: false, size: 25
    end
	end

  down do
    drop_table(:carreras)
	end
end
