# encoding: utf-8
require_relative 'app'
require 'json'

def datos_registro_form
  RSpec.describe App do
    describe '1. Obtener alumno por código de alumno: ' do
      it '1.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '1.2 Obtener alumno' do
        data = '20000001'
        url = 'alumno/codigo_alumno/' + data
        test = App.new(url)
        test.get()
        if test.response.code != 200 then
          puts test.response.body
        end
        expect(test.response.code).to eq(200)
        expect(test.response.body).not_to include('error')
        expect(test.response.body).to include('id')
        expect(test.response.body).to include('nombres')
        expect(test.response.body).to include('paterno')
        expect(test.response.body).to include('materno')
      end
    end
  end
end

datos_registro_form
