require 'sequel'

Sequel.migration do
  up do
    Sequel.connect('sqlite://db/ulima.db')
    #Sequel.connect('mysql2://localhost/ulima?user=root&password=123')
		DB.transaction do
	  	file = File.new('db/data/carreras.txt', 'r')
			while (line = file.gets)
				nombre = line.strip
				DB[:carreras].insert(nombre: nombre)
      end
		end
  end

	down do
		DB = Sequel.connect('sqlite://db/ulima.db')
    DB[:carreras].delete
	end
end
