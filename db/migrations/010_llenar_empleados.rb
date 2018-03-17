require 'sequel'

Sequel.migration do
  up do
    Sequel.connect('sqlite://db/ulima.db')
    #Sequel.connect('mysql2://localhost/ulima?user=root&password=123')
		DB.transaction do
	  	file = File.new('db/data/empleados.txt', 'r')
			while (line = file.gets)
        line_array = line.split('::')
        codigo = line_array[0]
        dni = line_array[1]
        nombres = line_array[2]
        paterno = line_array[3]
        materno = line_array[4]
        correo_personal = line_array[5]
        correo_laboral = line_array[6]
        celular = line_array[7]
				cargo_id = line_array[8].strip
        DB[:empleados].insert(
          codigo: codigo,
          dni: dni,
          nombres: nombres,
          paterno: paterno,
          materno: materno,
          correo_personal: correo_personal,
          correo_laboral: correo_laboral,
          celular: celular,
          cargo_id: cargo_id
        )
      end
		end
  end

	down do
		DB = Sequel.connect('sqlite://db/ulima.db')
		#DB = Sequel.connect('mysql2://localhost/ulima?user=root&password=123')
    DB[:empleados].delete
	end
end
