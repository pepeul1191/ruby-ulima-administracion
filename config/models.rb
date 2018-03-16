require_relative './database'

class Alumno < Sequel::Model(DB[:alumnos])

end

class Carrera < Sequel::Model(DB[:carreras])

end

class AlumnoEstado < Sequel::Model(DB[:alumno_estados])

end

class Empleado < Sequel::Model(DB[:empleados])

end

class Cargo < Sequel::Model(DB[:cargos])

end
