# encoding: utf-8
require_relative 'app'
require 'json'

def datos_registro_form
  RSpec.describe App do
    describe '1. Obtener evento por nombre_url: ' do
      it '1.1 Conexión con backend' do
        url = 'test/conexion'
        test = App.new(url)
        test.get()
        expect(test.response.code).to eq(200)
      end
      it '1.2 Obtener evento' do
        data = '70141722'
        url = 'empleado/dni/' + data
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
