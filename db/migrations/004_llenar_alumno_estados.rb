require 'sequel'

Sequel.migration do
  up do
    Sequel.connect('sqlite://db/ulima.db')
    #Sequel.connect('mysql2://localhost/ulima?user=root&password=123')
		DB.transaction do
	  	file = File.new('db/data/alumno_estados.txt', 'r')
			while (line = file.gets)
				nombre = line.strip
				DB[:alumno_estados].insert(nombre: nombre)
      end
		end
  end

	down do
		DB = Sequel.connect('sqlite://db/ulima.db')
    DB[:alumno_estados].delete
	end
end
