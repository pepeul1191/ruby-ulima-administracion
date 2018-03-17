class MyApp < Sinatra::Base
  get '/empleado/listar' do
    Empleado.to_a.to_json
  end
end
