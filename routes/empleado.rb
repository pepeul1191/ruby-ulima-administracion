class MyApp < Sinatra::Base
  get '/empleado/listar' do
    Empleado.limit(30).to_a.to_json
  end

  get '/empleado/obtener/:id' do
    Empleado.select(:id, :codigo, :dni, :nombres, :paterno, :materno, :correo_personal, :correo_laboral, :celular).where(:id => params[:id]).to_a[0].to_json
  end
end
