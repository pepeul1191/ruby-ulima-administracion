class MyApp < Sinatra::Base
  get '/empleado/listar' do
    Empleado.limit(30).to_a.to_json
  end

  get '/empleado/obtener/:id' do
    DB.fetch('
      SELECT E.id, E.codigo, E.dni, E.nombres, E.paterno, E.materno, E.correo_personal, E.correo_laboral, E.celular , C.nombre AS cargo FROM
      empleados E INNER JOIN cargos C ON E.cargo_id = C.id
      WHERE E.id = ?', params[:id]
    ).to_a[0].to_json
  end

  get '/empleado/codigo_empleado/:codigo_empleado' do
    Empleado.select(:id, :nombres, :paterno, :materno).where(:codigo => params[:codigo_empleado]).to_a[0].to_json
  end
end
