class MyApp < Sinatra::Base
  get '/alumno/listar' do
    Alumno.limit(30).to_a.to_json
  end

  get '/alumno/obtener/:id' do
    """
    Alumno.select(
      :id,
      :codigo,
      :dni,
      :nombres,
      :paterno,
      :materno,
      :correo_personal,
      :correo_alumno,
      :celular
    ).where(
      :id => params[:id]
    ).to_a[0].to_json
    """
    DB.fetch('
      SELECT A.id, A.codigo, A.dni, A.nombres, A.paterno, A.materno, A.correo_personal, A.correo_alumno, A.celular , C.nombre AS carrera FROM
      alumnos A INNER JOIN carreras C ON A.carrera_id = C.id
      WHERE A.id = ?', params[:id]
    ).to_a[0].to_json
  end

  get '/alumno/codigo_alumno/:codigo_alumno' do
    Alumno.select(
      :id,
      :nombres,
      :paterno,
      :materno
    ).where(
      :codigo => params[:codigo_alumno]
    ).to_a[0].to_json
  end
end
