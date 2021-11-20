require 'net/http'
require 'json'

class Services::LimiteDeGastos
  def self.get_limite_de_gastos(uf, cargo, municipio)
    uri = URI("https://divulgacandcontas.tse.jus.br/divulga/rest/v1/limitegastos/2030402020/M/#{uf}?cargo=#{cargo}&municipio=#{municipio}")
    res = Net::HTTP.get_response(uri)

    case res
    when Net::HTTPOK
      puts "OK"
      return JSON.parse(res.body)
    else
      puts "ERROR"
      return JSON.parse([])
    end
  end
end