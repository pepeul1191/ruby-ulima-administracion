require 'sequel'

Sequel.migration do
  up do
    Sequel.connect('sqlite://db/ulima.db')
    #Sequel.connect('mysql2://localhost/ulima?user=root&password=123')
		DB.transaction do
	  	file = File.new('db/data/alumnos.txt', 'r')
			while (line = file.gets)
        line_array = line.split('::')
        codigo = line_array[0]
        dni = line_array[1]
        nombres = line_array[2]
        paterno = line_array[3]
        materno = line_array[4]
        correo_personal = line_array[5]
        correo_alumno = line_array[6]
        celular = line_array[7]
        carrera_id = line_array[8]
				alumno_estado_id = line_array[9].strip
        DB[:alumnos].insert(
          codigo: codigo,
          dni: dni,
          nombres: nombres,
          paterno: paterno,
          materno: materno,
          correo_personal: correo_personal,
          correo_alumno: correo_alumno,
          celular: celular,
          carrera_id: carrera_id,
          alumno_estado_id: alumno_estado_id
        )
      end
		end
  end

	down do
		DB = Sequel.connect('sqlite://db/ulima.db')
		#DB = Sequel.connect('mysql2://localhost/ulima?user=root&password=123')
    DB[:alumnos].delete
	end
end
