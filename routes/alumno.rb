class MyApp < Sinatra::Base
  get '/alumno/listar' do
    Alumno.limit(30).to_a.to_json
  end

  get '/alumno/obtener/:id' do
    Alumno.select(:id, :codigo, :dni, :nombres, :paterno, :materno, :correo_personal, :correo_alumno, :celular).where(:id => params[:id]).to_a[0].to_json
  end
end
