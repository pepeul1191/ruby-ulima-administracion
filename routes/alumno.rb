class MyApp < Sinatra::Base
  get '/alumno/listar' do
    Alumno.to_a.to_json
  end
end
